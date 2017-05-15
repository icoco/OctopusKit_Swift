//
//  CategoryService.swift
//  OpenCart
//
//  Created by icoco7 on 15/05/2017.
//  Copyright © 2017 icoco. All rights reserved.
//

import UIKit
import OctopusKit

class CategoryService: OCWebService {
    
    /*
     * getCategories
     *
     * @parentId  if parentId is 0 then return top categories
     *
     * @ref: http://opencart.i2cart.com/index.php?route=category/category&json=1
     */
    class func getCategories( _ parentId:String? = nil )->CategoryService{
        
        let service : CategoryService = CategoryService()
        
        var params :Dictionary = [String:Any]()
        params["parentId"] = parentId
        params["route"] = "category/category"
        params["json"] = "1"
        
        service.parameters = params
        service.method = RequestMethod.get.rawValue
        
        //@step
        let event = OCServiceEvent()
       
        event.dataFilter =  {  response -> OCResponse in
            //@step if need then format the result here
            Tracer.debug("dataFilter->",response)
            
            return response;
        }
        
        service.event = event
        return service
        
    }
}
