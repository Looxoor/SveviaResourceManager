//
//  HomeNavigationController.swift
//  SveviaResourceManager
//
//  Created by Björn Holmér on 2018-10-09.
//  Copyright © 2018 Seizemore Consulting. All rights reserved.
//

import UIKit

class HomeNavigationController: UINavigationController {
    
    @IBOutlet weak var HomeTabBar: UITabBarItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
             let tabBarTitleText = NSLocalizedString("homeDescription", comment: "Home screen text on tab bar title")
              HomeTabBar.title = String.localizedStringWithFormat(tabBarTitleText)
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
