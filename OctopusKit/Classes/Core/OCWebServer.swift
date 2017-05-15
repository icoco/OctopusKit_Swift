//
//  OCWebServer.swift
//  OctopusKit
//
//  Created by icoco7 on 11/26/16.
//  Copyright © 2016 icoco. All rights reserved.
//

import Foundation
import Alamofire

public class OCWebServer :Object {
    public var baseURL :String = ""
    
    
    /*
    @purpose  The global default instance Web Server keep the baseURL and more information which will be 
        use by the global instance of  DataManager
    */
   
    public static let `default` = OCWebServer()
    
    class func instanceWithUrl(_ baseUrl: String) -> OCWebServer{
        let  server:OCWebServer = OCWebServer(baseUrl)
        return server
    }
    
     override init(){
       
    }
    
     init(_ baseUrl:String){
        self.baseURL = baseUrl
    }
    
    deinit {
        
       Tracer.debug(self,"->deinit")
    }

    private var _requestHeader : HTTPHeaders?
    
    public var requestHeader : HTTPHeaders!{
        get{
            if (nil == _requestHeader){
                _requestHeader = OCWebServer.defaultHTTPHeaders()
            }
            return _requestHeader!
        }
        set(value){
            _requestHeader = value
        }
    }

   static var _defaultHeaders: HTTPHeaders?
   public static func defaultHTTPHeaders ()-> HTTPHeaders!{
        guard nil == _defaultHeaders else {
            return _defaultHeaders
        }
        
        _defaultHeaders = OCWebServer.getDefaultHTTPHeaders()
        return _defaultHeaders
    }
    
    /// Creates default values for the "Accept-Encoding", "Accept-Language" and "User-Agent" headers.
    open static  func getDefaultHTTPHeaders()->HTTPHeaders {
        
        // Accept-Encoding HTTP Header; see https://tools.ietf.org/html/rfc7230#section-4.2.3
        let acceptEncoding: String = "gzip;q=1.0, compress;q=0.5"
        
        // Accept-Language HTTP Header; see https://tools.ietf.org/html/rfc7231#section-5.3.5
        let acceptLanguage = Locale.preferredLanguages.prefix(6).enumerated().map { index, languageCode in
            let quality = 1.0 - (Double(index) * 0.1)
            return "\(languageCode);q=\(quality)"
            }.joined(separator: ", ")
        
        // User-Agent Header; see https://tools.ietf.org/html/rfc7231#section-5.5.3
        // Example: `iOS Example/1.0 (org.alamofire.iOS-Example; build:1; iOS 10.0.0) Alamofire/4.0.0`
        let userAgent: String = {
            if let info = Bundle.main.infoDictionary {
                let executable = info[kCFBundleExecutableKey as String] as? String ?? "Unknown"
                let bundle = info[kCFBundleIdentifierKey as String] as? String ?? "Unknown"
                let appVersion = info["CFBundleShortVersionString"] as? String ?? "Unknown"
                let appBuild = info[kCFBundleVersionKey as String] as? String ?? "Unknown"
                
                let osNameVersion: String = {
                    let version = ProcessInfo.processInfo.operatingSystemVersion
                    let versionString = "\(version.majorVersion).\(version.minorVersion).\(version.patchVersion)"
                    
                    let osName: String = {
                        #if os(iOS)
                            return "iOS"
                        #elseif os(watchOS)
                            return "watchOS"
                        #elseif os(tvOS)
                            return "tvOS"
                        #elseif os(macOS)
                            return "OS X"
                        #elseif os(Linux)
                            return "Linux"
                        #else
                            return "Unknown"
                        #endif
                    }()
                    
                    return "\(osName) \(versionString)"
                }()

                let kitVersion: String = {
                    
                    return "kit/1.6.8"
                }()
                
                return "\(executable)/\(appVersion) (\(bundle); build:\(appBuild); \(osNameVersion)) ;\(kitVersion)"
            }
            
            return "???"
        }()
        
        return [
            "Accept-Encoding": acceptEncoding,
            "Accept-Language": acceptLanguage,
            "User-Agent": userAgent
        ]
    }
}
