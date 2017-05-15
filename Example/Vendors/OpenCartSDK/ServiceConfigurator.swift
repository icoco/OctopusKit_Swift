//
//  ServiceConfigurator.swift
//  OpenCart
//
//  Created by icoco7 on 15/05/2017.
//  Copyright © 2017 icoco. All rights reserved.
//

import UIKit
import OctopusKit

class ServiceConfigurator {
    
    //@ref  http://opencart.i2cart.com/index.php?
    static func setupWorkSpace(){
        OCWebServer.default.baseURL = "http://opencart.i2cart.com/index.php"
    }
}
