//
//  HTTPRequest.swift
//  Shopping
//
//  Created by Alexey Oleksandrovich on 4/2/19.
//  Copyright © 2019 Alexey Oleksandrovich. All rights reserved.
//

import Foundation

class HTTPRequest {
    private var _route:Route
    
    var route:Route { return self._route };
    var parameters: [String: String]? = nil
    var headerValues: [String: String]? = nil
    
    init(_ route: Route) {
        self._route = route
    }
}
