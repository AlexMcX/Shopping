//
//  LoginController.swift
//  Shopping
//
//  Created by Alexey Oleksandrovich on 3/23/19.
//  Copyright © 2019 Alexey Oleksandrovich. All rights reserved.
//

import Foundation

class LoginController: Controller {
    @objc dynamic var view:LoginView!
    @objc dynamic var authService:AuthService!
    
    public func login(route:Route, username: String, password: String) {
        authService.basic(route: .AUTH, username: username, password: password)
    }
}
