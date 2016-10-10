//
//  FaqDetailViewController.swift
//  conference
//
//  Created by Bharath Bandaru on 08/10/16.
//  Copyright © 2016 ux. All rights reserved.
//

import UIKit

class FaqDetailViewController: UIViewController {

    @IBOutlet weak var uicolor: UIView!
    @IBOutlet weak var uiques: UILabel!
    @IBOutlet weak var uians: UITextView!
    var store = ""
    var store2 = ""
    var store3 :UInt = 0xffffff
    override func viewDidLoad() {
        super.viewDidLoad()
        uiques.text = store
        uians.text = store2
        uicolor.backgroundColor =  UIColorFromRGB(store3)
        // Do any additional setup after loading the view.
    }
    func UIColorFromRGB(_ rgbValue: UInt) -> UIColor {
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
