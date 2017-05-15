//
//  TestDataManager.swift
//  iOS Example
//
//  Created by icoco on 10/5/2016.
//  Copyright © 2016 Alamofire. All rights reserved.
//

import XCTest

import Alamofire
 


class TestDataManager: XCTestCase {
    
  
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testJson(){
        let urlString:String = "http://127.0.0.1/api/v1/user/customer/"
         let expectation = self.expectation(description: "\(urlString) 401")
     
        Alamofire.request( urlString,method:HTTPMethod.get, parameters: ["foo": "bar"],encoding: URLEncoding.queryString ,headers:nil)
            .validate()
            .responseJSON { response in
                   debugPrint( "result: \(response.description)");
                switch response.result {
                case .success:
                    
                    debugPrint("Validation Successful")
                     expectation.fulfill()
                case .failure(let error):
                    debugPrint(error)
                    
                    expectation.fulfill()
                }
        }
        
        //@step
        waitForExpectations(timeout: 10, handler: nil)
    }
    
    //@case
    func testDataManager() {
        let expectation = self.expectation(description: "\(self) 401")
        //@step define the default base url
        OCWebServer.default.baseURL = "http://127.0.0.1"
        
        let urlString:String = "/api/v1/user/customer/"
       

        let service = OCWebService();
        service.route = urlString
        
        var event = OCServiceEvent()
        
       //@step use default manager instance
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
        waitForExpectations(timeout: 10, handler: nil)
        
        
    }
    
    //@case
    func testWebCall() {
           let expectation = self.expectation(description: "\(self) 401")
        // this not effect if the service has set new manager
        OCWebServer.default.baseURL = "http://127.0.0.1"
        
        let urlString:String = "https://www.baidu.com"
       
        
        let service = OCWebService();
        service.route = urlString
        
        let manager: OCDataManager = OCDataManager("") // or assgin with new base url
        service.manager = manager
        
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
        waitForExpectations(timeout: 70, handler: nil)
    }
    

    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
