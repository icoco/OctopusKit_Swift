//
//  AppServiceTests.swift
//  AppServiceTests
//
//  Created by icoco on 04/04/2020.
//  Copyright © 2020 icoco. All rights reserved.
//

import XCTest
@testable import SDK
import OctopusKit

class AppServiceTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        //@step setup
        Tracer.level = Tracer.Level.debug
        ServiceConfigurator.setupWorkSpace()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    //@case
    func testList() {
        let expectation = self.expectation(description: "\(self) 401")
        
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
  
    //@case
    func testCreate() {
        let expectation = self.expectation(description: "\(self) 401")
        //@step
        
        let name = "iOS Demo App@" + DateUtil.getCurrentTimeAsString()
        let service:AppService = AppService.create(name)
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
    
    //@case
    func testDelete() {
        let expectation = self.expectation(description: "\(self) 401")
        //@step
        
        let id = "31"
        let service:AppService = AppService.delete(id)
        service.execute({ (response ) in
            let data : Data = response as! Data
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
