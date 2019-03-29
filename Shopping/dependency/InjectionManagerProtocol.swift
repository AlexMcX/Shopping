//
//  InjectionManagerProtocol.swift
//  Shopping
//
//  Created by Alexey Oleksandrovich on 3/27/19.
//  Copyright © 2019 Alexey Oleksandrovich. All rights reserved.
//

import Foundation

protocol InjectionManagerProtocol {
    func injection(injector:InjectionProtocol)
//    func getInjection(cls: NSObject.Type) -> InjectionProtocol?
    func registerInjection(injection:InjectionProtocol)
//    func registerInjection(injector:InjectionProtocol.Type)
}
