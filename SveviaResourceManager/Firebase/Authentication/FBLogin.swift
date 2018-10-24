//
//  FBLogin.swift
//  SveviaResourceManager
//
//  Created by Björn Holmér on 2018-10-24.
//  Copyright © 2018 Seizemore Consulting. All rights reserved.
//

import UIKit
import Firebase

class FBLogin {
    func login(emailString: String?, passwordString: String?, vc: UIViewController) {
        let localize = LocalizeStrings()
        let feedbackGenerator = UINotificationFeedbackGenerator()
        
        Auth.auth().useAppLanguage()
        
        if ((emailString?.isEmpty)!) {
            vc.showLocalizedAlert(titleDescriptor: "emailEmptyTitle", titleComment: "Title to show if the email field is empty", messageDescriptor: "emailEmptyMessage", messageComment: "Message to show if the email field is empty", alertStyle: .alert, actions: .init(title: "OK", style: .cancel, handler: nil))
            feedbackGenerator.notificationOccurred(.error)
        } else if (validateEmail(candidate: emailString!) == false) {
            vc.showLocalizedAlert(titleDescriptor: "emailIncorrectlyFormattedTitle", titleComment: "Title to show if the email adress is incorrectly formatted", messageDescriptor: "emailIncorrectlyFormattedMessage", messageComment: "Message to show if the email adress is incorrectly formatted", alertStyle: .alert, actions: .init(title: "OK", style: .cancel, handler: nil))
            feedbackGenerator.notificationOccurred(.error)
        }
        
        if ((passwordString?.isEmpty)!) {
            vc.showLocalizedAlert(titleDescriptor: "passwordEmptyTitle", titleComment: "Title to show if the password field is empty", messageDescriptor: "passwordEmptyMessage", messageComment: "Message to show if the password field is empty", alertStyle: .alert, actions: .init(title: "OK", style: .cancel, handler: nil))
            feedbackGenerator.notificationOccurred(.error)
        }
        if let email = emailString, let password = passwordString {
            if validateEmail(candidate: email) {
                Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
                    if error == nil {
                        if (user?.user.uid) != nil {
                            feedbackGenerator.notificationOccurred(.success)
                        }
                        vc.dismiss(animated: true, completion: nil)
                    }
                    else
                    {
                        var alertController = UIAlertController(title: "", message: error?.localizedDescription, preferredStyle: .alert)
                        let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                        localize.setUIAlertControllerTitleString(&alertController, titleDescriptor: "loginErrorTitle", titleComment: "The UIAlert title to show if there is an error")
                        alertController.addAction(defaultAction)
                        vc.present(alertController, animated: true, completion: nil)
                        feedbackGenerator.notificationOccurred(.error)
                    }
                }
            }
        }
    }
    
    func validateEmail(candidate: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: candidate)
    }
}
