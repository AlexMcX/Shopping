//
//  BaseView.swift
//  Shopping
//
//  Created by Alexey Oleksandrovich on 3/23/19.
//  Copyright © 2019 Alexey Oleksandrovich. All rights reserved.
//

import UIKit

class View: UIViewController, InjectionProtocol, InjectionHandlerProtocol {

    convenience init() {
        self.init(nibName: nil, bundle: nil);
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil);
        
        initialize()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder:aDecoder)
        
        initialize();
    }
    
    private func initialize() {
        InjectionManager.instance.injection(injector: self)
        
        onInit();
    }
    
    func onInit() {
        
    }
    
    func onInjection() {
        
    }
}
