//
//  ServiceConfigurator.swift
//  OpenCart
//
//  Created by icoco7 on 15/05/2017.
//  Copyright © 2017 icoco. All rights reserved.
//

import UIKit
import OctopusKit

public class ServiceConfigurator {
    
    //@ref  http://www.ixkit.com/api/
    public static func setupWorkSpace(_ baseUrl:String? = nil, _ isDebug:Bool? = false){
        if isDebug!{
            Tracer.level = Tracer.Level.debug
        }
        if let url = baseUrl{
            OCWebServer.default.baseURL = url
            return
        }
        OCWebServer.default.baseURL = "http://www.ixkit.com/api/"
    }
}

//public class MyTracer {
//    public static let tracer = OctopusKit.Tracer
//}
