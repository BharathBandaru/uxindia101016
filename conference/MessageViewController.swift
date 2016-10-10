//
//  MessageViewController.swift
//  conference
//
//  Created by Laxmi Rekha on 08/09/16.
//  Copyright © 2016 ux. All rights reserved.
//

import UIKit

class MessageViewController: UIViewController {

    @IBOutlet weak var msg: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        let border = CALayer()
        let width = CGFloat(2.0)
        border.borderColor = UIColor.black.cgColor
        border.frame = CGRect(x: 0, y: msg.frame.size.height-width, width:  msg.frame.size.width, height: msg.frame.size.height)
        
        border.borderWidth = width
        msg.layer.addSublayer(border)
        msg.layer.masksToBounds = true
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
