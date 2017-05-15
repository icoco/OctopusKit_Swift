//
//  ExampleTests.swift
//  ExampleTests
//
//  Created by icoco on 16/11/2016.
//  Copyright © 2016 Alamofire. All rights reserved.
//

import XCTest

class ExampleTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testSimpleCall() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        var event : OCServiceEvent = OCServiceEvent()
        
       // event.beforeInvoke = nil;
        //event.dataFilter = nil
   //     event.free()
        
        let service:OCWebService = OCWebService("")
        
        
      //  service.event = event
    //    let manager:OCDataManager = OCDataManager()
     //   manager.baseURL = ""
      
    }
    
    func testStrings() {
        var value:String = ""
        if (String.isEmpty(value)){
            debugPrint("is empty")
        }
        XCTAssert( String.isEmpty(value) , "Must init a validate Web Server !")
        value = "xxx"
        XCTAssert( !String.isEmpty(value) , "Must init a validate Web Server !")
        
        
    }
   
    func testDictionary(){
        let name = "this is me"
        let age = 188
       // let d =  Dictionary<String, Any>.instanceWithParametersBindings(name,age)
        
      let dd =  Dictionary<String, Any>.dictionaryOfVariableBindings(name,age)
        
        
        print(dd)
        
        
    }
    
    func testTracer(){
        print("ssss\nxxxxxx","xxxx\n","xxxs")
        
        let service = OCWebService()
        let event = OCServiceEvent()
        let server = OCWebServer()
        let manager = OCDataManager.default
        manager.invokeService(service)
        
    }
}
