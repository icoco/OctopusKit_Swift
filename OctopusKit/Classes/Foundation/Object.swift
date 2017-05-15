//
//  BaseObject.swift
//  OctopusKit
//
//  Created by icoco7 on 11/26/16.
//  Copyright © 2016 icoco. All rights reserved.
//

import Foundation
 

open class Object{
    
    public init(){
        Tracer.info("\(self)->init")
    }
    deinit {
        
        Tracer.info("\(self)->deinit")
    }
    
}
