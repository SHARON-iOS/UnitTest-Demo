//
//  LoginViewModel.swift
//  Unit-Testing-Sample
//
//  Created by SHARON D ROSE on 10/09/20.
//  Copyright © 2020 SHARON D ROSE. All rights reserved.
//

import Foundation
import UIKit

struct LoginViewModel {
    
    //MARK: - Variables
    var userName: String
    var email: String
    var password: String
    var confirmPassword: String
    var isSignInActive: Bool {
        return checkEmptyFields()
    }
    
    
    //MARK: - Initialisation
    init() {
        userName = ""
        email = ""
        password = ""
        confirmPassword = ""
    }
    
    init(userName: String, email: String, password: String, confirmPassword: String) {
        self.userName = userName
        self.email = email
        self.password = password
        self.confirmPassword = confirmPassword
    }
}

extension LoginViewModel {
    
    func checkEmptyFields() -> Bool {
        if (userName != "" && email != "" && password != "" && confirmPassword != "") {
            return true
        }
        else {
            return false
        }
    }
    
    func isValidUserName() -> Bool {
        return userName.count > 3
    }
    
  
    
    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    func isValidPassword() -> String? {
        if self.password.count <= 1 {
            return "Please, enter a password"
        }
        
        if (password.count < 6) {
            return "Password must not be shorter than 6 characters"
        }
        
        if (!NSPredicate(format: "SELF MATCHES %@", ".*[A-Z]+.*").evaluate(with: password)) {
            return "Password must contain at least one uppercase letter"
        }
        
        if (!NSPredicate(format: "SELF MATCHES %@", ".*[a-z]+.*").evaluate(with: password)) {
            return "Password must contain at least one lowercase letter"
        }
        
        if (!NSPredicate(format: "SELF MATCHES %@", ".*[0-9]+.*").evaluate(with: password)) {
            return "Password must contain at least one number"
        }
        
        return nil
    }
    
    func doPasswordsMatch() -> Bool {
        return password == confirmPassword
    }

    func signUpAction(vc: UIViewController) {
        if self.checkEmptyFields() == false {
            UIAlertController.showSimpleAlert(vc,
                                              title: "Error",
                                              message: "Please fill all Fields")
        }
        else if self.isValidUserName() == false {
            UIAlertController.showSimpleAlert(vc,
                                              title: "Error",
                                              message: "Please enter valid first name")
        }
        else if self.isValidEmail() == false {
            UIAlertController.showSimpleAlert(vc,
                                              title: "Error",
                                              message: "Please enter valid email")
        }
              
        else if let passwordError = isValidPassword(), passwordError != "" {
            UIAlertController.showSimpleAlert(vc,
                                              title: "Error",
                                              message: passwordError)
        }
        else if self.doPasswordsMatch() == false {
            UIAlertController.showSimpleAlert(vc,
                                              title: "Error",
                                              message: "Password mismatched")
        }
        else {
            UIAlertController.showSimpleAlert(vc,
                                              title: "Success",
                                              message: "Registered successfully")
        }
        
    }
}

extension UIAlertController {
    static func showSimpleAlert(_ vc: UIViewController, title: String?, message: String?) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
        }))
        vc.present(alertController, animated: true, completion: nil)
    }
}
