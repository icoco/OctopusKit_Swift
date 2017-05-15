//
//  Strings.swift
//  OctopusKit
//
//  Created by icoco7 on 11/26/16.
//  Copyright © 2016 icoco. All rights reserved.
//
extension String{
    static func isEmpty (_ value :String?) -> Bool {
        if let string = value {
            if (string.isEmpty){
                return true
            }
            return    string.characters.count  <= 0
        } else {
            return true
        }
    }
}

 
