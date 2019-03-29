//
//  BaseController.swift
//  Shopping
//
//  Created by Alexey Oleksandrovich on 3/23/19.
//  Copyright © 2019 Alexey Oleksandrovich. All rights reserved.
//

//import Foundation
//import UIKit

class Controller: Injection, ControllerProtocol, InjectionHandlerProtocol {
    weak private var view:View!;
    
    required init(view:View) {
        self.view = view;
        
        super.init()
    }
    
    deinit {
        view = nil
    }
    
    func onInjection() {
        print("onInjection \(String(describing: self))")
    }
}
