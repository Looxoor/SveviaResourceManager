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
    @IBOutlet weak var LoginScreenCancelButton: UIBarButtonItem!
    @IBOutlet weak var LoginScreenLoginButton: UIButton!
    @IBOutlet weak var LoginScreenLabel: UILabel!
    
    let localize = LocalizeStrings()
    
    //    var delegate: LoginSuccessDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Populate UIItems with strings from Localizable.strings.
        localize.setTextFieldPlaceholder(&LoginScreenEmailTextField, localizableDescriptor: "emailDescription", comment: "Email adress")
        localize.setTextFieldPlaceholder(&LoginScreenPasswordTextField, localizableDescriptor: "passwordDescription", comment: "Password")
        localize.setNavigationBarTitle(&LoginScreenNavBar, localizableDescriptor: "loginDescription", comment: "Log in text on navigation bar title")
        localize.setNavigationBarButtonTitle(&LoginScreenCancelButton, localizableDescriptor: "cancelDescription", comment: "Cancel text on navigation bar button")
        localize.setButtonTitle(&LoginScreenLoginButton, localizableDescriptor: "loginDescription", comment: "Login text on login screen button")
        localize.setLabelText(&LoginScreenLabel, localizableDescriptor: "loginInfoDescription", comment: "Login information in login screen label")
        
    }
    
    //Actions
    @IBAction func LoginScreenCancelButtonClick(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func LoginScreenLoginButtonAction(_ sender: Any) {
    }
    
}
