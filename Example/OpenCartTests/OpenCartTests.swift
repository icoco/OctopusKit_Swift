//
//  OpenCartTests.swift
//  OpenCartTests
//
//  Created by icoco7 on 15/05/2017.
//  Copyright © 2017 icoco. All rights reserved.
//

import XCTest
@testable import OpenCart

class OpenCartTests: XCTestCase {
    
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
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    //@case
    func testCategroyService() {
        let expectation = self.expectation(description: "\(self) 401")
        //@step setup
        ServiceConfigurator.setupWorkSpace()
        //@step 
        let parent_id = ""
        let service:CategoryService = CategoryService.getCategories()
        service.execute({ (response ) in
            
          
            let data : Data = response as! Data
            
            let dataString :String = String(data: data, encoding: String.Encoding.utf8)!
            debugPrint(dataString)
            
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
    func testProduct() {
        let expectation = self.expectation(description: "\(self) 401")
         
        let keywords = "iPhone"
        let service:ProductService = ProductService.serach(keywords, 1)
        service.execute({ (response ) in
     
            let data : Data = response as! Data
            
            let dataString :String = String(data: data, encoding: String.Encoding.utf8)!
            debugPrint(dataString)
            
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
