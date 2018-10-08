//
//  LoginViewController.swift
//  SveviaResourceManager
//
//  Created by Björn Holmér on 2018-10-04.
//  Copyright © 2018 Seizemore Consulting. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
 
    @IBOutlet weak var LoginScreenEmailTextField: UITextField!
    @IBOutlet weak var LoginScreenPasswordTextField: UITextField!
    @IBOutlet weak var LoginScreenNavBar: UINavigationItem!
    @IBOutlet weak var LoginScreenDoneButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let emailText = NSLocalizedString("emailDescription", comment: "Email adress")
        LoginScreenEmailTextField.placeholder = String.localizedStringWithFormat(emailText)
        
        let passwordText = NSLocalizedString("passwordDescription", comment: "Password")
        LoginScreenPasswordTextField.placeholder = String.localizedStringWithFormat(passwordText)
        
        let navBarTitleText = NSLocalizedString("loginDescription", comment: "Log in text on navigation bar title")
        LoginScreenNavBar.title = String.localizedStringWithFormat(navBarTitleText)
        
        let doneButtonText = NSLocalizedString("loginDescription", comment: "Log in text on navigation bar button")
        LoginScreenDoneButton.title = String.localizedStringWithFormat(doneButtonText)

    }
    
    @IBAction func LoginScreenDoneButtonClick(_ sender: UIBarButtonItem) {
    }

}

