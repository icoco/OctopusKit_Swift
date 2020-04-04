//
//  Logger.swift
//  DemoApp
//
//  Created by icoco on 04/04/2020.
//  Copyright © 2020 icoco. All rights reserved.
//

import UIKit

class Logger {
    public static func debugJsonData(_ message:String, _ data:Data,  function function: String = #function, _ filePath: String = #file, _ fileLine: Int = #line){
        
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
