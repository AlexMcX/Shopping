//
//  Service.swift
//  Shopping
//
//  Created by Alexey Oleksandrovich on 3/23/19.
//  Copyright © 2019 Alexey Oleksandrovich. All rights reserved.
//

class Service: Injection, InjectionHandlerProtocol {
    func onInjection() {
        print("onInjection \(String(describing: self))")
    }
}
