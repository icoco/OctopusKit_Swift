//
//  Dictionary.swift
//  OctopusKit
//
//  Created by icoco7 on 11/26/16.
//  Copyright © 2016 icoco. All rights reserved.
//

import Foundation

extension Dictionary {
    
    func f(_ args: Int...) {
        args.forEach {
            print($0)
        }
    }
    static func fun (_ args: Any...){
        for i in 0 ..< args.count / 2 {
            print(args[i*2 + 0], args[i * 2 + 1])
        }
    }
    
    static func instanceWithParametersBindings(_ arguments:CVarArg...)->Dictionary
    {
        let p: CVaListPointer = getVaList(arguments)
        
    
        for i in 0 ..< arguments.count / 2 {
            let key = arguments[i * 2 + 0]
            let value = arguments[i * 2 + 1]
            
            debugPrint(key)
            debugPrint(value)
            
        }
        //        var result = [:]
        //        var i = 0
        //        var key, value
        for a in arguments {
            //  debugPrint(a)
        }
        
        
        var marker :va_list;
        
        
        
        
        return [:]
    }
    
    static func dictionaryOfVariableBindings(_ arguments :Any...) -> Dictionary<String,Any> {
        var d = Dictionary<String,Any>()
        print( arguments.customMirror.description)
        print (arguments.debugDescription)
        
        for (name,value) in arguments.enumerated(){
            //d["v\(ix+1)"] = value
            d["v\(name+1)"] = value
        }
        return d
    }
    


    public mutating func merge<K, V>(_ dict: [K: V]?){
        guard nil != dict else {
            return
        }
        for (k, v) in dict! {
            self.updateValue(v as! Value, forKey: k as! Key)
        }
    }
}

