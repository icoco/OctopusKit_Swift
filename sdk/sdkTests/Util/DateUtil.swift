//
//  DateUtil.swift
//  SDKTests
//
//  Created by icoco on 04/04/2020.
//  Copyright © 2020 icoco. All rights reserved.
//

import UIKit

class DateUtil: NSObject {
    
    static func getCurrentTimeAsString() -> String {
        let now = Date()
        
        let formatter = DateFormatter()
        
        formatter.timeZone = TimeZone.current
        
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        let dateString = formatter.string(from: now)
        return dateString
    }
}
