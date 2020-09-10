//
//  ViewController.swift
//  Unit-Testing-Sample
//
//  Created by SHARON D ROSE on 10/09/20.
//  Copyright © 2020 SHARON D ROSE. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var signupButton: UIButton!

    fileprivate var viewModel = LoginViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func signUpAction(_ sender: UIButton) {
           viewModel.signUpAction(vc: self)
       }
}


extension ViewController: UITextFieldDelegate {
    @objc func textFieldDidChange(_ textField: UITextField) {
        let text = textField.text
        switch textField {
        case usernameTextField:
            self.viewModel.userName = text ?? ""
        case emailTextField:
            self.viewModel.email = text ?? ""
        case passwordTextField:
            self.viewModel.password = text ?? ""
        case confirmPasswordTextField:
            self.viewModel.confirmPassword = text ?? ""
        default: break
        }
    }
}
