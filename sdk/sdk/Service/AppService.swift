//
//  AppService.swift
//  SDK
//
//  Created by icoco on 04/04/2020.
//  Copyright © 2020 icoco. All rights reserved.
//

import UIKit
import OctopusKit

public class AppService: OCWebService {
    
    /*
     * api: http://www.ixkit.com/api/app
     * method: get
     * purpose: list all app
     * return: json
     */
    public class func list( _ pageIndex:Int = 1 )->AppService{
        let service : AppService = AppService()
        var params :Dictionary = [String:Any]()
        params["pageIndex"] = pageIndex
        service.parameters = params
        service.method = RequestMethod.get.rawValue
        service.route = "app"
        
        //@step
        let event = OCServiceEvent()
        event.dataFilter =  {  response -> OCResponse in
            //@step if need then format the result here
            Tracer.debug("dataFilter->",response)
            return response;
        }
        service.event = event
        return service
    }

    /*
     * api: http://www.ixkit.com/api/app/13
     * method: get
     * purpose: show app detail
     * return: json
     */
    public class func detail( _ id:String)->AppService{
        let service : AppService = AppService()
        service.method = RequestMethod.get.rawValue
        service.route = "app" + "/" + id
        //@step
        let event = OCServiceEvent()
        event.dataFilter =  {  response -> OCResponse in
            //@step if need then format the result here
            Tracer.debug("dataFilter->",response)
            return response;
        }
        service.event = event
        return service
    }
    
    /*
     * api: http://www.ixkit.com/api/app/
     * method: post
     * purpose: create a new app data
     * return: json
     */
    public class func create( _ name:String)->AppService{
        let service : AppService = AppService()
        var params :Dictionary = [String:Any]()
        params["name"] = name
        service.parameters = params
        service.method = RequestMethod.post.rawValue
        service.route = "app"
        //@step
        let event = OCServiceEvent()
        event.dataFilter =  {  response -> OCResponse in
            //@step if need then format the result here
            Tracer.debug("dataFilter->",response)
            return response;
        }
        service.event = event
        return service
    }
    
    /*
     * api: http://www.ixkit.com/api/app/15
     * method: delete
     * purpose: delete a app data by id
     * return: json
     */
    public class func delete( _ id:String )->AppService{
        let service : AppService = AppService()

        service.method = RequestMethod.delete.rawValue
        service.route = "app" + "/" + id
        //@step
        let event = OCServiceEvent()
        event.dataFilter =  {  response -> OCResponse in
            //@step if need then format the result here
            Tracer.debug("dataFilter->",response)
            return response;
        }
        service.event = event
        return service
    }
}
