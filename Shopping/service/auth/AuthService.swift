//
//  AuthService.swift
//  Shopping
//
//  Created by Alexey Oleksandrovich on 3/24/19.
//  Copyright © 2019 Alexey Oleksandrovich. All rights reserved.
//
import Foundation

class AuthService: HTTPService {
    @objc dynamic var clientService:ClientDataService!    
    
    // PUBLIC
    public func basic(username:String, password:String, completionHandler: @escaping (Bool) -> Void) {
        let loginString:String = String(format: "%@:%@", username, password)
        let loginData:Data = loginString.data(using: String.Encoding.utf8)!
        let base64LoginString:String = loginData.base64EncodedString()
        let httpRequest:HTTPRequest = HTTPRequest(.AUTH)
        
        httpRequest.headerValues = ["Authorization":"Basic \(base64LoginString)"]
        
        request(with: httpRequest) { (data, error) in
            guard let json:[String:Any] = data as? [String : Any] else {
                completionHandler(false)
                return
            }
            
            guard let result = json["result"] as? Bool else {
                completionHandler(false)
                return
            }
            
            if (result) {
                self.clientService.update(json: data as! [String : Any])
                
                self.clientService.save()
            }
            
            completionHandler(result)
        }
    }
    
    public func uuid(value: String?, completionHandler: @escaping () -> Void) {
        let httpRequest:HTTPRequest = HTTPRequest(.AUTH)
        
        httpRequest.parameters = [:]
        
        if (value != nil) {
            httpRequest.parameters!["uuid"] = value
        }
        
        request(with: httpRequest) {(data, error) in
            guard let data = data else { return }
            
            self.clientService.update(json: data as! [String : Any])
            
            completionHandler()
        }
    }
}
