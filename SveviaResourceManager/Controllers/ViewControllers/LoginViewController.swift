//
//  LoginViewController.swift
//  SveviaResourceManager
//
//  Created by Björn Holmér on 2018-10-04.
//  Copyright © 2018 Seizemore Consulting. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {
    
    @IBOutlet weak var LoginScreenEmailTextField: UITextField!
    @IBOutlet weak var LoginScreenPasswordTextField: UITextField!
    @IBOutlet weak var LoginScreenNavBar: UINavigationItem!
    @IBOutlet weak var LoginScreenCancelButton: UIBarButtonItem!
    @IBOutlet weak var LoginScreenLoginButton: UIButton!
    @IBOutlet weak var LoginScreenLabel: UILabel!
    
    var handle: AuthStateDidChangeListenerHandle?
    
    let localize = LocalizeStrings()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        Auth.auth().useAppLanguage()
        handle = Auth.auth().addStateDidChangeListener { (auth, user) in
            // [START_EXCLUDE]
            // [END_EXCLUDE]
        }
        // [END auth_listener]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Populate UIItems with strings from Localizable.strings.
        localize.setTextFieldPlaceholder(&LoginScreenEmailTextField, localizableDescriptor: "emailDescription", comment: "Email adress")
        localize.setTextFieldPlaceholder(&LoginScreenPasswordTextField, localizableDescriptor: "passwordDescription", comment: "Password")
        localize.setNavigationBarTitle(&LoginScreenNavBar, localizableDescriptor: "loginDescription", comment: "Log in text on navigation bar title")
        localize.setNavigationBarButtonTitle(&LoginScreenCancelButton, localizableDescriptor: "cancelDescription", comment: "Cancel text on navigation bar button")
        localize.setButtonTitle(&LoginScreenLoginButton, localizableDescriptor: "loginDescription", comment: "Login text on login screen button")
        localize.setLabelText(&LoginScreenLabel, localizableDescriptor: "loginInfoDescription", comment: "Login information in login screen label")
        LoginScreenEmailTextField.becomeFirstResponder()
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        // [START remove_auth_listener]
        Auth.auth().removeStateDidChangeListener(handle!)
        // [END remove_auth_listener]
    }
    
    //Actions
    @IBAction func LoginScreenCancelButtonClick(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func LoginScreenLoginButtonAction(_ sender: Any) {
        let emailField = LoginScreenEmailTextField.text
        let passwordField = LoginScreenPasswordTextField.text
        let login = FBLogin()
        
        login.login(emailString: emailField, passwordString: passwordField, vc: self)
    }
    
    @IBAction func enterKeyPressed(_ sender: Any) {
        LoginScreenPasswordTextField.becomeFirstResponder()
    }
    

}
