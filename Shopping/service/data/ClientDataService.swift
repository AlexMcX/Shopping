//
//  ClientDataService.swift
//  Shopping
//
//  Created by Alexey Oleksandrovich on 3/27/19.
//  Copyright © 2019 Alexey Oleksandrovich. All rights reserved.
//

import Foundation
import CoreData

class ClientDataService: DataService {

    @objc dynamic var client:Client!
    @objc dynamic var authService:AuthService!
    
    override func onInit() {
        initModel(entityName: "Client", managedObjectClass: Client.self)
    }
    
    override func onInjection() {
        authService.uuid(value: client.uuid) { () in
            
        }
    }
    
    public func update(json: [String:Any]) {
        client.setValuesForKeysSafe(json)
    }
}
