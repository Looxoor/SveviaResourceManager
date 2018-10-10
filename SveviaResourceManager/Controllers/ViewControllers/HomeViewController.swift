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
    
    var loggedIn = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Intitialize localized strings

        let navBarTitleText = NSLocalizedString("homeDescription", comment: "Home screen text on navigation bar title")
        let homeScreenLabelTextNotLoggedIn = NSLocalizedString("homeScreenNotLoggedIn", comment: "Home screen text label when not logged in")
        let homeScreenLabelTextLoggedIn = NSLocalizedString("homeScreenLoggedIn", comment: "Home screen text label when logged in")
        let loginButtonText = NSLocalizedString("loginDescription", comment: "Log in text on navigation bar button")
        
        // Set strings to UIItems
        HomeScreenNavBar.title = String.localizedStringWithFormat(navBarTitleText)

        //Change UI depending on login state
        if self.loggedIn != true {
            HomeScreenLabel.text = String.localizedStringWithFormat(homeScreenLabelTextNotLoggedIn)
      
            let loginButton = UIBarButtonItem(title: String.localizedStringWithFormat(loginButtonText), style: .plain, target: self, action: #selector(loadLoginScreen(_:)))
            self.HomeScreenNavBar.setRightBarButton(loginButton, animated: true)
        }else{
            HomeScreenLabel.text = String.localizedStringWithFormat(homeScreenLabelTextLoggedIn)
        }
    
    }
    
    //Actions

    @objc func loadLoginScreen(_ sender: UIBarButtonItem) {
        _ = UIStoryboard(name: "Main", bundle: nil)
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "LoginVCID")
        present(vc!, animated: true, completion: nil)    }
    
}
