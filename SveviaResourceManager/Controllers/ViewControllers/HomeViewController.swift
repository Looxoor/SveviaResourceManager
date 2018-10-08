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

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let navBarTitleText = NSLocalizedString("homeDescription", comment: "Home screen text on navigation bar title")
        HomeScreenNavBar.title = String.localizedStringWithFormat(navBarTitleText)
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
