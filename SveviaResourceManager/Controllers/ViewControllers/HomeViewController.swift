//
//  HomeViewController.swift
//  SveviaResourceManager
//
//  Created by Björn Holmér on 2018-10-08.
//  Copyright © 2018 Seizemore Consulting. All rights reserved.
//

import UIKit
import Firebase


class HomeViewController: UIViewController {
    
    @IBOutlet weak var HomeScreenNavBar: UINavigationItem!
    @IBOutlet weak var HomeScreenLabel: UILabel!
    
    let localize = LocalizeStrings()
    
    var handle: AuthStateDidChangeListenerHandle?
    var loggedIn = false
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        Auth.auth().useAppLanguage()
        handle = Auth.auth().addStateDidChangeListener { (auth, user) in
            // [START_EXCLUDE]
            self.updateUI()
            // [END_EXCLUDE]
        }
        // [END auth_listener]
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Populate UIItems with strings from Localizable.strings
        localize.setNavigationBarTitle(&HomeScreenNavBar, localizableDescriptor: "homeDescription", comment: "Home screen text on navigation bar title")
        updateUI()
        
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        // [START remove_auth_listener]
        Auth.auth().removeStateDidChangeListener(handle!)
        // [END remove_auth_listener]
    }
    
    //Actions
    
    @objc func loadLoginScreen(_ sender: UIBarButtonItem) {
        _ = UIStoryboard(name: "Main", bundle: nil)
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "LoginVCID")
        present(vc!, animated: true, completion: nil)
    }
    
    @objc func logout(_ sender: UIBarButtonItem) {
        do {
            try Auth.auth().signOut()
            updateUI()
        }catch{
            showLocalizedAlert(titleDescriptor: "logoutErrorTitle", titleComment: "Title to show when there is an error logging out", messageDescriptor: "logoutErrorMessage", messageComment: "Message to show when there is an error logging out", alertStyle: .alert, actions: .init(title: "OK", style: .cancel, handler: nil))
        }
    }
    
    //Functions
        
    func updateUI() {
        setLoggedInState()
        
        if self.loggedIn != true {
            localize.setLabelText(&HomeScreenLabel, localizableDescriptor: "homeScreenNotLoggedIn", comment: "Home screen text label when not logged in")
            
            var loginButton = UIBarButtonItem(title: "", style: .plain, target: self, action: #selector(loadLoginScreen(_:)))
            localize.setNavigationBarButtonTitle(&loginButton, localizableDescriptor: "loginDescription", comment: "Log in text on navigation bar button")
            self.HomeScreenNavBar.setRightBarButton(loginButton, animated: true)
            
        } else {
            
            localize.setLabelText(&HomeScreenLabel, localizableDescriptor: "homeScreenLoggedIn", comment: "Home screen text label when logged in")
            
            var logoutButton = UIBarButtonItem(title: "", style: .plain, target: self, action: #selector(logout(_:)))
            localize.setNavigationBarButtonTitle(&logoutButton, localizableDescriptor: "logoutDescription", comment: "Log out text on navigation bar button")
            self.HomeScreenNavBar.setRightBarButton(logoutButton, animated: true)
        }
    }
    
    func setLoggedInState() {
        if (Auth.auth().currentUser?.uid) != nil {
            self.loggedIn = true
        }else{
            self.loggedIn = false
        }
    }
    
}
