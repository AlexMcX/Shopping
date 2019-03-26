//
//  AuthService.swift
//  Shopping
//
//  Created by Alexey Oleksandrovich on 3/24/19.
//  Copyright © 2019 Alexey Oleksandrovich. All rights reserved.
//
import Foundation

class AuthService: HTTPService {
//    override init() {
//        print("*-*-*-**-*-")
//    }
    
    override init() {
        super.init()
        print("AuthService:init")
    }
    
    required init?(coder decoder: NSCoder) {
        super.init()
    }
    
    public func basic(route:Route, username:String, password:String) {
        let loginString:String = String(format: "%@:%@", username, password)
        let loginData:Data = loginString.data(using: String.Encoding.utf8)!
        let base64LoginString:String = loginData.base64EncodedString()
                
        request(route: route, parameters: nil, headerValues: ["Authorization":"Basic \(base64LoginString)"])
    }
}
