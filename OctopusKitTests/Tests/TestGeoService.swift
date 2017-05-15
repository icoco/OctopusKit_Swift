//
//  TestGeoService.swift
//  iOS Example
//
//  Created by icoco on 22/11/2016.
//  Copyright © 2016 Alamofire. All rights reserved.
//

import XCTest

import Alamofire



class TestGeoService: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
         //@case
    func testGeoName() {
        let expectation = self.expectation(description: "\(self) 401")
        //@step define the default base url
        OCWebServer.default.baseURL = "http://api.geonames.org"
        
        let service:GeoService = GeoService.name()
        service.execute({ (response ) in
            
            debugPrint( "\(self)-> success result: \(response.debugDescription)");
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
         
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    
    //@case
    func testGet() {
        let expectation = self.expectation(description: "\(self) 401")
        //@step define the default base url
        OCWebServer.default.baseURL = "http://127.0.0.1:8999"
        
        let service:NodeService = NodeService.get("Go to",188,90909090.223 )
        service.execute({ (response ) in
            
            debugPrint( "\(self)-> success result: \(response.debugDescription)");
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
    func testPost() {
        let expectation = self.expectation(description: "\(self) 401")
        //@step define the default base url
        OCWebServer.default.baseURL = "http://127.0.0.1:8999"
        
        let service:NodeService = NodeService.post("Go to",669 , 122909090.23)
        service.execute({ (response ) in
            
            debugPrint( "\(self)-> success result: \(response.debugDescription)");
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
