//
//  HomeViewController.swift
//  SveviaResourceManager
//
//  Created by Björn Holmér on 2018-10-08.
//  Copyright © 2018 Seizemore Consulting. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var HomeScreenNavBar: UINavigationItem!
    @IBOutlet weak var HomeScreenLabel: UILabel!
    
    let localize = LocalizeStrings()
    
    var loggedIn = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Populate UIItems with strings from Localizable.strings
        localize.setNavigationBarTitle(&HomeScreenNavBar, localizableDescriptor: "homeDescription", comment: "Home screen text on navigation bar title")
        
        
        //Change UI depending on login state
        if self.loggedIn != true {
            localize.setLabelText(&HomeScreenLabel, localizableDescriptor: "homeScreenNotLoggedIn", comment: "Home screen text label when not logged in")
            
            var loginButton = UIBarButtonItem(title: "", style: .plain, target: self, action: #selector(loadLoginScreen(_:)))
            localize.setNavigationBarButtonTitle(&loginButton, localizableDescriptor: "loginDescription", comment: "Log in text on navigation bar button")
            self.HomeScreenNavBar.setRightBarButton(loginButton, animated: true)
        }else{
            localize.setLabelText(&HomeScreenLabel, localizableDescriptor: "homeScreenLoggedIn", comment: "Home screen text label when logged in")
        }
        
    }
    
    //Actions
    
    @objc func loadLoginScreen(_ sender: UIBarButtonItem) {
        _ = UIStoryboard(name: "Main", bundle: nil)
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "LoginVCID")
        present(vc!, animated: true, completion: nil)    }
    
}
