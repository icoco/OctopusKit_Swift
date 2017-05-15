//
//  OCWebService.swift
//  OctopusKit
//
//  Created by icoco7 on 11/26/16.
//  Copyright © 2016 icoco. All rights reserved.
//
import Foundation
import Alamofire

/// See https://tools.ietf.org/html/rfc7231#section-4.3
/// Clone from Alamofire
public enum RequestMethod: String {
    case options = "OPTIONS"
    case get     = "GET"
    case head    = "HEAD"
    case post    = "POST"
    case put     = "PUT"
    case patch   = "PATCH"
    case delete  = "DELETE"
    case trace   = "TRACE"
    case connect = "CONNECT"
}


public typealias RequestHeaders = [String: String]

open class OCWebService:Object {
    var serviceId : String?
   open var method : String = "GET"
   open var parameters : Parameters?
   open var headers  : RequestHeaders?
   open var route : String?;
   open var event :OCServiceEvent?;
   open var manager:OCDataManager?
    
    public override init(){
        super.init()
        self.route = ""
    }
    
    
    init (_ route:String? = nil){
        self.route = route;
        
        self.serviceId = "";
        self.method = "GET";
        self.event = OCServiceEvent()
    }
    
    init (route:String,method:String,parameters:Parameters?,headers  : RequestHeaders?){
        self.route = route
        self.serviceId = ""
        self.method = method
        self.parameters = parameters
        self.headers = headers
        
    }
    
    public func getUrl ( baseUrl: String?)->String?{
        var result = ""
        guard nil == baseUrl else {
             result = baseUrl! + self.route!
            return result
        }
        
        return self.route
    }
    
    deinit {
        self.route = nil;
        self.event = nil;
        
    }
    
     @discardableResult
    open func execute(_ success:@escaping InvokeSuccess,failure:@escaping InvokeFailure)->Request?{
        if (nil != self.manager) {
            return self.manager?.invokeService(self,success: success, failure: failure)
        }
       return OCDataManager.default.invokeService(self, success: success, failure: failure)
    }
    
}


// MARK: Request Header - Default HTTP Headers
extension OCWebService {

  
    
}


// MARK: - CustomDebugStringConvertible

extension OCWebService: CustomDebugStringConvertible {
  
    public var debugDescription: String {
        var output: [String] = []
        let cls = String(describing: type(of: self))
        
        output.append("[self]: \(cls)" )
       
        output.append(route != nil ? "[route]: \(route!)" : "\n[route]: nil")
        output.append(method != nil ? "[method]: \(method)" : "\n[method]: nil")
        output.append(parameters != nil ? "[parameters]: \(parameters)" : "\n[parameters]: nil")
        output.append(headers != nil ? "[headers]: \(headers)" : "\n[headers]: nil")
     
        output.append(event != nil ? "[event]: \(event!)" : "\n[event]: nil")
        output.append(manager != nil ? "[manager]: \(manager!)" : "\n[manager]: nil")
        return output.joined(separator: "\n")
    }
}
