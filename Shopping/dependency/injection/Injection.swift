//
//  Injection.swift
//  Shopping
//
//  Created by Alexey Oleksandrovich on 3/25/19.
//  Copyright © 2019 Alexey Oleksandrovich. All rights reserved.
//

import Foundation

class Injection: NSObject, InjectionProtocol {
    override init() {
        super.init()
        
        InjectionManager.instance.injection(injector: self)
        
        onInit()
    }
    
    func onInit() {
        
    }
}
