//
//  OCServiceEvent.swift
//  OctopusKit
//
//  Created by icoco7 on 11/26/16.
//  Copyright © 2016 icoco. All rights reserved.
//
import Foundation

import Alamofire

 
protocol EventProtocol {
    var name: String { get }
    mutating func fire()
}



open class OCServiceEvent :Object{
    
  public  var beforeInvoke: ((_ source:AnyObject) -> AnyObject?)?
 
  public  var dataFilter:((OCResponse) -> OCResponse?)? //= nil
    
  public  var success:((OCResponse) -> OCResponse?)?
    
  public  var error :((Error?) -> Void?)?
    
  public  var complete:((OCResponse) -> AnyObject?)?
 
    public override init (){
        super.init()
        self.dataFilter = {[weak self] response -> OCResponse in
             Tracer.debug(self ,"->dataFilter, response=\(response.debugDescription)");
            
            return response;
        }
        
    }
    
    func free(){
        self.beforeInvoke = nil
        self.dataFilter = nil
        self.success = nil
        self.error = nil
        self.complete = nil
    }

    deinit {
        self.beforeInvoke = nil
        self.dataFilter = nil
          
    }
}





