//
//  Tracer.swift
//  iOS
//
//  Created by Robin
//

import Foundation

public struct Tracer{

     private static func output(_ args: Any...){
  
        debugPrint(args)
     
    debugPrint("--------------------------------------------------------------------------------------------\n")
    }
    
    private static func trace_d( _ args: Any... , _ buf: String = {
        print("assgin default ")
        return "Function:\(#function),File:\(#file),Line:\(#line):"
        }()){
        print("buf:",buf)
        Tracer.output(buf, args)
    }
    
 
    private static func getShortFileName(filePath:String)->String{
        let url = NSURL(fileURLWithPath: filePath)
        let result :String! = url.lastPathComponent == nil ? filePath: url.lastPathComponent!
        return result
    }
    
    public static func info(_ args: Any?...,  _ function: String = #function, _ filePath: String = #file, _ fileLine: Int = #line ){
        let fileName = Tracer.getShortFileName(filePath: filePath)
        let buf = "\(fileName)->\(function),Line:\(fileLine):"
        debugPrint(buf)
        Tracer.output( args)
        
        
    }
    
    public static func debug(_ args: Any?...,  _ function: String = #function, _ filePath: String = #file, _ fileLine: Int = #line ){
        let fileName = Tracer.getShortFileName(filePath: filePath)
        let buf = "\(fileName)->\(function),Line:\(fileLine):"
        debugPrint(buf)
        Tracer.output( args)
        
        
    }
}
