//
//  ProductService.swift
//  OpenCart
//
//  Created by icoco7 on 15/05/2017.
//  Copyright © 2017 icoco. All rights reserved.
//

import UIKit
import OctopusKit

class ProductService: OCWebService {

    /*
     * @function search
     * @keywords
     * @page
     *
     * @ref: http://opencart.i2cart.com/index.php?route=product/search&search=iphone&page=1&json
     */
    class func serach(_ keywords:String, _ page: Int)->ProductService{
        let service : ProductService = ProductService()
        //service.route = "/get"
        
        var params :Dictionary = [String:Any]()
        params["search"] = keywords
        params["page"] = page
        params["route"] = "product/search"
        params["json"] = "1"
        
        service.parameters = params
        
        
        return service
    }
}
