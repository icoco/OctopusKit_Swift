//
//  SDKTests.swift
//  SDKTests
//
//  Created by icoco on 04/04/2020.
//  Copyright © 2020 icoco. All rights reserved.
//

import XCTest
@testable import SDK

class SDKTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        //@step setup
        ServiceConfigurator.setupWorkSpace()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    //@case
    func testAppService() {
        let expectation = self.expectation(description: "\(self) 401")
        //@step setup
        ServiceConfigurator.setupWorkSpace()
        //@step
        let service:AppService = AppService.list()
        service.execute({ (response ) in
            if let data = response as? Data{
                Tracer.debugJsonData("\(self)->response:", data)
            }
            expectation.fulfill()
            },  failure: { (error)in
                debugPrint( "\(self)-> failure: \(error)");
                expectation.fulfill()
            }
        )
        //@step
        waitForExpectations(timeout: 40, handler: nil)
    }
    
}
