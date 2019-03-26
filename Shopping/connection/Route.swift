//
//  Route.swift
//  Shopping
//
//  Created by Alexey Oleksandrovich on 3/24/19.
//  Copyright © 2019 Alexey Oleksandrovich. All rights reserved.
//

var HOST: String { return "http://localhost:4201"}

enum Route {
    case AUTH
    case LOGOUT
}

extension Route {
    var method: REST {
        switch self {
            case .AUTH: return REST.GET
            case .LOGOUT: return REST.POST
        }
    }
    
    var path: String {
        switch self {
            case .AUTH: return HOST + "/auth"
            case .LOGOUT: return HOST + "/logout"
        }
    }
}
