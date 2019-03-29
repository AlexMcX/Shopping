//
//  ViewController.swift
//  Shopping
//
//  Created by Alexey Oleksandrovich on 3/20/19.
//  Copyright © 2019 Alexey Oleksandrovich. All rights reserved.
//

import UIKit

class LoginView: View {

    @IBOutlet weak var emailLabel: UITextField!
    @IBOutlet weak var passLabel: UITextField!
    
    @objc dynamic var controller:LoginController!
    
    @IBAction func login (sender: UIButton!) {
        guard let username = emailLabel.text, let password = passLabel.text else { return }
        
        controller.login(route: .AUTH, username: username, password: password)
    }

}
