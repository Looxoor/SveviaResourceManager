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
    
    
    //    var delegate: LoginSuccessDelegate?
    
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
        
        Auth.auth().useAppLanguage()
        
        if (emailField?.isEmpty)! {
            showLocalizedAlert(titleDescriptor: "emailEmptyTitle", titleComment: "Title to show if the email field is empty", messageDescriptor: "emailEmptyMessage", messageComment: "Message to show if the email field is empty", alertStyle: .alert, actions: .init(title: "OK", style: .cancel, handler: nil))
        } else if (validateEmail(candidate: emailField!) == false) {
            showLocalizedAlert(titleDescriptor: "emailIncorrectlyFormattedTitle", titleComment: "Title to show if the email adress is incorrectly formatted", messageDescriptor: "emailIncorrectlyFormattedMessage", messageComment: "Message to show if the email adress is incorrectly formatted", alertStyle: .alert, actions: .init(title: "OK", style: .cancel, handler: nil))
        }
        
        if (passwordField?.isEmpty)! {
            showLocalizedAlert(titleDescriptor: "passwordEmptyTitle", titleComment: "Title to show if the password field is empty", messageDescriptor: "passwordEmptyMessage", messageComment: "Message to show if the password field is empty", alertStyle: .alert, actions: .init(title: "OK", style: .cancel, handler: nil))
        }
        if let email = emailField, let password = passwordField {
            if validateEmail(candidate: email) {
                Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
                    if error == nil {
                        if let name = user?.user.uid {
                            print("Nuvarande användare: ",name)
                        }
                        self.dismiss(animated: true, completion: nil)
                    }
                    else
                    {
                        var alertController = UIAlertController(title: "", message: error?.localizedDescription, preferredStyle: .alert)
                        let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                        self.localize.setUIAlertControllerTitleString(&alertController, titleDescriptor: "loginErrorTitle", titleComment: "The UIAlert title to show if there is an error")
                        alertController.addAction(defaultAction)
                        self.present(alertController, animated: true, completion: nil)
                    }
                }
            }
        }
    }
    
    
    //Functions
    func validateEmail(candidate: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: candidate)
    }
}
