//
//  NodeService.swift
//  iOS Example
//
 
import Foundation

class  NodeService: OCWebService {

    //@ref http://127.0.0.1:8999/get?aaa=xxxxx&bbb=99929&=*900中文
    class func get(_ name:String, _ age: Int, _ salary: Double )->NodeService{
        let service : NodeService = NodeService()
        service.route = "/get"
      
        var params :Dictionary = [String:Any]()
        params = ["name":name,"age":age,"salary":salary]
        
        service.parameters = params
        service.headers = ["token":"99999999988888888"]
        
        return service
    }
    
    //@ref http://127.0.0.1:8999/post?aaa=xxxxx&bbb=99929&=*900中文
    class func post(_ name:String, _ age: Int, _ salary: Double )->NodeService{
        let service : NodeService = NodeService()
        service.route = "/post"
        service.method = RequestMethod.post.rawValue
        
        var params :Dictionary = [String:Any]()
        params = ["name":name,"age":age,"salary":salary]
        
        service.parameters = params
        service.headers = ["token":"!@**##($*&&#_)&^%%#@^^!"]
        
        return service
    }
}
