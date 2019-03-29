//
//  BaseController.swift
//  Shopping
//
//  Created by Alexey Oleksandrovich on 3/23/19.
//  Copyright © 2019 Alexey Oleksandrovich. All rights reserved.
//

import Foundation

class Controller: NSObject, ControllerProtocol, InjectionProtocol, InjectionHandlerProtocol {
    override init() {
        super.init()
        
        InjectionManager.instance.injection(injector: self)
        
        onInit()
    }
    
    func onInit() {
        
    }
    
    func onInjection() {
//        print("onInjection \(String(describing: self))")
    }
}
