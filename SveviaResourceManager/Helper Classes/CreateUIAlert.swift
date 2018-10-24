//
//  CreateUIAlert.swift
//  SveviaResourceManager
//
//  Created by Björn Holmér on 2018-10-20.
//  Copyright © 2018 Seizemore Consulting. All rights reserved.
//

import UIKit

extension UIViewController {
  
    func showLocalizedAlert(titleDescriptor: String, titleComment: String, messageDescriptor: String, messageComment: String, alertStyle: UIAlertController.Style, actions: UIAlertAction...) {
        
        let localize = LocalizeStrings()
        var alert = UIAlertController(title: "", message: "", preferredStyle: alertStyle)
        localize.setUIAlertControllerStrings(&alert, titleDescriptor: titleDescriptor, titleComment: titleComment, messageDescriptor: messageDescriptor, messageComment: messageComment)
        
        for alertActions in actions {
            alert.addAction(alertActions)
        }
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func showAlert(title: String, message: String, alertStyle: UIAlertController.Style, actions: UIAlertAction...) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: alertStyle)
        
        for alertActions in actions {
            alert.addAction(alertActions)
        }
        
        self.present(alert, animated: true, completion: nil)
    }
}
