//
//  OCDataManager.swift
//  OctopusKit
//
//  Created by icoco7 on 11/26/16.
//  Copyright © 2016 icoco. All rights reserved.
//

import Foundation
import Alamofire



public typealias InvokeSuccess = ( Any?) -> Void

public typealias InvokeFailure = ( Error?) -> Void


open class OCDataManager :Object{
    
    var baseURL:String?{
        get{
            var result:String = ""
            if (nil != self.server) {
                result = self.server!.baseURL
            }
            return result;
        }
        
    }
    
    private var server : OCWebServer?{
        didSet{
            
        }
    }
    /*
     @purpose  The  global default instance DataManager invoke by every Web Service if it doesn't specify new Data Manager
     */
    open static let `default`: OCDataManager = {
        let server:OCWebServer = OCWebServer.default
        //@step
       // assert(!String.isEmpty(server.baseURL) , "Must init a validate Web Server !")
        //@step
        let result: OCDataManager =  OCDataManager(server)
        Tracer.debug(result,"->create")
        return result;
    }()
  
    class func instanceWithBaseUrl(_ baseUrl : String?)->OCDataManager{
        let result : OCDataManager = OCDataManager(baseUrl)
        return result
    }
    
//    public init(){
//    }
    
    public init( _ baseUrl:String?){
        self.server = OCWebServer(baseUrl!)
    }

    public init( _ server:OCWebServer?){
        self.server = server
    }
   
    
    deinit {
        self.server = nil
        print("%@->deinit",self)
    }
    

    
    private func download (_ service: OCWebService )->Request{
            let destination = DownloadRequest.suggestedDownloadDestination(
                for: .cachesDirectory,
                in: .userDomainMask
            )
             let url = service.getUrl(baseUrl: self.baseURL)
            return  Alamofire.download(url!, method: .get, parameters: service.parameters, encoding: URLEncoding.queryString, headers: service.headers, to: destination);
        
    }
    
 
    public func invokeService(_ service: OCWebService )->Request{
        Tracer.debug("service:",service )
        
        let methodStr = service.method.uppercased();
        //@case download
        guard "DOWNLOAD" != methodStr else {
                return self.download(service);
          }
        //@case step other operation: GET | POST | DELETE etc
        let method = HTTPMethod(rawValue:methodStr);

        let url = service.getUrl(baseUrl: self.baseURL)
        
        Tracer.debug("Alamofire.request:",url )
        //@step
        var headers :HTTPHeaders = (self.server?.requestHeader)!
        headers.merge(service.headers)
        //@step
        return Alamofire.request(url!, method: method!, parameters: service.parameters, encoding: URLEncoding.default, headers: headers);
        
    }
    
    //@nouse
    private func invokeService_nouse(_ service: OCWebService, completionHandler: (NSURLRequest?, HTTPURLResponse?, NSData?, NSError?) -> Void )->Request?{
      
        let request:Request = self.invokeService(service);
       
        return request;
    }

    open func invokeService(_ service: OCWebService, success:@escaping InvokeSuccess, failure:@escaping InvokeFailure )->Request{
        
        if nil != service.event && nil != service.event?.beforeInvoke {
            Tracer.debug(self,"->beforeInvoke",service );
            let event = service.event! as OCServiceEvent;
            let fired = event.beforeInvoke!(service);
        }
        
        let request = self.invokeService(service) as! DataRequest
        //@step
        request.responseData {[weak self] (response:DataResponse<Data>) in
         
            //Tracer.debug(self,"->responseData:", response)
            switch response.result {
                case .success:
                    OCDataManager.handleSuccess(response, service: service, success: success)
                case .failure:
                    OCDataManager.handleFailure(response, service, failure: failure)
            }
            //@step
            OCDataManager.handleComplete(response,service)
         }
        return request
    }

    //MARK: - class static methods
    class func handleSuccess( _ response:DataResponse<Data>, service:OCWebService,success:@escaping InvokeSuccess) ->Void{
        var rep = response;
        Tracer.debug(self,"->handleSuccess,response:",response)
        //@step do filter if needs
        if (nil != service.event && nil != service.event?.dataFilter) {
            var proxyResponse :OCResponse = OCResponse(response: response)
            proxyResponse =  service.event!.dataFilter!(proxyResponse)!;
            rep = proxyResponse.dataResponse!
           
        }
        //@step fire success
        if  Tracer.isDebug,  let data = rep.result.value as Data? {
            Tracer.debugJsonData("responseData:",data)
        }
        return success(rep.result.value as AnyObject? );
    }

    class func handleFailure( _ response:DataResponse<Data>, _  service:OCWebService,failure:@escaping InvokeFailure) ->Void{
        Tracer.debug(self,"->handleFailure, error: ", response.result)
        failure(response.result.error);
    }
    
    class func handleComplete( _ response:DataResponse<Data>, _  service:OCWebService) ->Void{
        Tracer.debug(self,"->handleComplete")
        guard (service.event?.complete) == nil else {
             let proxyResponse :OCResponse = OCResponse(response: response)
             service.event?.complete!(proxyResponse)
            return
        }
    }
}
