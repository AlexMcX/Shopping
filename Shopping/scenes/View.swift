//
//  BaseView.swift
//  Shopping
//
//  Created by Alexey Oleksandrovich on 3/23/19.
//  Copyright © 2019 Alexey Oleksandrovich. All rights reserved.
//

import UIKit

class View: UIViewController {
    var controller:Controller!;
    
    var controllerCLS:Controller.Type { return Controller.self }

    convenience init() {
        self.init(nibName: nil, bundle: nil);
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil);
        
        onInit();
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder:aDecoder)
        
        onInit();
    }
    
    private func onInit() {
        createController();
    }
    
    private func createController() {
        controller = controllerCLS.init(view: self) as Controller
    }
}
