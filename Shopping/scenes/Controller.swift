//
//  BaseController.swift
//  Shopping
//
//  Created by Alexey Oleksandrovich on 3/23/19.
//  Copyright © 2019 Alexey Oleksandrovich. All rights reserved.
//

//import Foundation
//import UIKit

class Controller: Injection, ControllerProtocol {
    weak private var view:View!;
    
    required init(view:View) {
        self.view = view;
        
        super.init()
        
        InjectionManager.instance.injection(injector: self)
        
        onInit()
    }
    
    deinit {
        view = nil
    }
    
    func onInit() {
        
    }
}
