//
//  LoginViewController.swift
//  conference
//
//  Created by Laxmi Rekha on 23/08/16.
//  Copyright © 2016 ux. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passcodeTF: UITextField!
    let password = "uxindia2016"
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.layoutIfNeeded()
        emailTF.delegate = self
        passcodeTF.delegate = self

        // for tapping
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: Selector("dismissKeyboard")))
              loginButton.clipsToBounds=true
        loginButton.layer.cornerRadius=loginButton.frame.size.height/2
        let border = CALayer()
        let width = CGFloat(2.0)
        border.borderColor = UIColor.darkGray.cgColor
        border.frame = CGRect(x: 0, y: emailTF.frame.size.height - width, width:  emailTF.frame.size.width, height: emailTF.frame.size.height)
        
        border.borderWidth = width
        emailTF.layer.addSublayer(border)
        emailTF.layer.masksToBounds = true
        let borderp = CALayer()
        _ = CGFloat(2.0)
        borderp.borderColor = UIColor.darkGray.cgColor
        borderp.frame = CGRect(x: 0, y: passcodeTF.frame.size.height - width, width:  passcodeTF.frame.size.width, height: passcodeTF.frame.size.height)
        
        borderp.borderWidth = width
        passcodeTF.layer.addSublayer(borderp)
       passcodeTF.layer.masksToBounds=true
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func LoginButtonAction(_ sender: AnyObject) {
        print("clicked")
        print(emailTF.text)
        print(passcodeTF.text)
        if passcodeTF.text == password {
            let defaults = UserDefaults.standard
            defaults.set(true, forKey: "firsttime")
            defaults.set(emailTF.text!, forKey: "username")
            let mainStoryBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let tbc = mainStoryBoard.instantiateViewController(withIdentifier: "mytabs") as! TabbedController
            self.present(tbc, animated: true, completion: nil)
            
        }
        else
        {
            let alertController = UIAlertController(title: "Invalid password", message:
                "Please use the password sent to your registered mail IDs", preferredStyle: UIAlertControllerStyle.alert)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default,handler: nil))
            self.present(alertController, animated: true, completion: nil)

        }
    }
    func dismissKeyboard() {
        emailTF.resignFirstResponder()
        passcodeTF.resignFirstResponder()

    }
    
    // for hitting return
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        emailTF.resignFirstResponder()
        passcodeTF.resignFirstResponder()

        return true
    }
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
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
