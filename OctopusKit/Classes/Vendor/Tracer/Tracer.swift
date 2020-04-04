//
//  Tracer.swift
//  iOS
//
//  Created by Robin
//

import Foundation

public struct Tracer{
    public enum Level : String {
        case silent = "silent"
        case info = "info"
        case debug = "debug"
        case warning = "warning"
        case error = "error"
    }
    public static var level = Level.silent
    
    public static var isDebug:Bool{
        return Level.silent != level
    }
    private static func output(_ args: Any...){
  
        debugPrint(args)
     
        debugPrint("--------------------------------------------------------------------------------------------\n")
    }
    
//    private static func trace_d( _ args: Any... , _ buf: String = {
//        print("assgin default ")
//        return "Function:\(#function),File:\(#file),Line:\(#line):"
//        }()){
//        print("buf:",buf)
//        Tracer.output(buf, args)
//    }
    
 
    private static func getShortFileName(filePath:String)->String{
        let url = NSURL(fileURLWithPath: filePath)
        let result :String! = url.lastPathComponent == nil ? filePath: url.lastPathComponent!
        return result
    }
    
    public static func info(_ args: Any?...,  function function: String = #function, _ filePath: String = #file, _ fileLine: Int = #line ){
        if !isDebug{
            return
        }
        let fileName = Tracer.getShortFileName(filePath: filePath)
        let buf = "\(fileName)->\(function),Line:\(fileLine):"
        debugPrint(buf)
        Tracer.output( args)
        
        
    }
    
    public static func debug(_ args: Any?...,  function function: String = #function, _ filePath: String = #file, _ fileLine: Int = #line ){
        if !isDebug{
            return
        }
        let fileName = Tracer.getShortFileName(filePath: filePath)
        let buf = "\(fileName)->\(function),Line:\(fileLine):"
        debugPrint(buf)
        Tracer.output( args)
        
        
    }
    
    public static func debugJsonData(_ message:String, _ data:Data,  function function: String = #function, _ filePath: String = #file, _ fileLine: Int = #line){
        if !isDebug{
            return
        }
        let fileName = Tracer.getShortFileName(filePath: filePath)
        let buf = "\(fileName)->\(function),Line:\(fileLine):"
        debugPrint(buf)
        debugPrint(message)
        do {
            
            if let jsonResult = try JSONSerialization.jsonObject(with: data, options: []) as? NSDictionary {
                debugPrint(jsonResult)
            }
        } catch let error {
            print(error.localizedDescription)
        }
    }
}
