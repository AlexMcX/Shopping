//
//  IInjection.swift
//  Shopping
//
//  Created by Alexey Oleksandrovich on 3/25/19.
//  Copyright © 2019 Alexey Oleksandrovich. All rights reserved.
//

import Foundation

protocol InjectionHandlerProtocol: InjectionProtocol {
    func onInjection()
}

/*
    Don't dynamic create when init injection protocol
    append to base onjection protocol when register instance this protocol as
 
    InjectionManagerProtocol.registerInjection
 */
protocol InjectionInstanceProtocol: InjectionProtocol {
    
}

protocol InjectionProtocol: NSObjectProtocol {
    
}
