//
//  GeoService.swift
//  iOS Example
//
//  Created by icoco on 22/11/2016.
//  Copyright © 2016 Alamofire. All rights reserved.
//

import Foundation

class GeoService: OCWebService {
    
    //@ref http://api.geonames.org/citiesJSON?north=44.1&south=-9.9&east=-22.4&west=55.2&lang=de&username=demo
    class func name()->GeoService{
        let service : GeoService = GeoService()
        service.route = "/citiesJSON"
       // let params :[String:Any] = [:]
        var params :Dictionary = [String:Any]()
        params = ["north":44.1,"south":-9.9,"east":-22.4,"west":55.2,"lang":"de","username":"demo"]
   
        service.parameters = params
        service.headers = ["token":"99999999988888888"]
        
        return service
    }
    
 
}
