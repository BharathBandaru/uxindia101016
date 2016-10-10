




//
//  TabbedController.swift
//  conference
//
//  Created by Laxmi Rekha on 23/08/16.
//  Copyright © 2016 ux. All rights reserved.
//

import UIKit

class TabbedController: UITabBarController {
    
    @IBOutlet weak var tab: UITabBar!
    override func viewDidLoad() {
        
        self.selectedIndex=2
    }
    var freshLaunch = true
    override func viewWillAppear(_ animated: Bool) {
        if freshLaunch == true {
            freshLaunch = false
            self.tabBarController?.selectedIndex = 2// 5th tab
        }
    }

}
