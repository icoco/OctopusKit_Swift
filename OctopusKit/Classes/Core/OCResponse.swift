//
//  OCResponse.swift
//  OctopusKit
//
//  Created by icoco7 on 11/26/16.
//  Copyright © 2016 icoco. All rights reserved.
//

import Foundation
import Alamofire

public class OCResponse :Object {
    public  let dataResponse:DataResponse<Data>?
    
    
    public init( response: DataResponse<Data>?=nil){
        self.dataResponse = response
        
    }
    
    public func  reverse()->DataResponse<Data>{
        return self.dataResponse!
    }
    deinit {
        Tracer.debug(self,"->deinit")
    }

}


extension OCResponse: CustomStringConvertible, CustomDebugStringConvertible {
    /// The textual representation used when written to an output stream, which includes whether the result was a
    /// success or failure.
    public var description: String {
        return dataResponse.debugDescription
    }
    
    public var debugDescription: String {
        return (self.dataResponse?.debugDescription)!
    }
}

//MARK: - DataResponse for Alamofire
/*
 extension to DataResponse
 */
extension DataResponse{
    
    
//    static func reverse( proxyResponse:OCResponse?)->DataResponse{
//    let response = proxyResponse?.dataResponse
//    self.request = response?.request
//    self.response = response?.response
//    self.result = response?.result as Result
//    self.timeline = (response?.timeline)!
//    self.data = response?.data
//    }
}
