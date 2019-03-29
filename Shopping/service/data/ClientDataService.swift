//
//  ClientDataService.swift
//  Shopping
//
//  Created by Alexey Oleksandrovich on 3/27/19.
//  Copyright © 2019 Alexey Oleksandrovich. All rights reserved.
//

import Foundation

class ClientDataService: DataService {

    @objc dynamic var client:Client!
    
    override func onInit() {
        initModel(entityName: "Client")
    }
}
