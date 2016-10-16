//
//  MessageViewController.swift
//  conference
//
//  Created by Laxmi Rekha on 08/09/16.
//  Copyright © 2016 ux. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import SystemConfiguration


struct postStruct {
    let message  : String!
    let name : String!
}

class MessageViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {

    var posts = [postStruct]()
    @IBOutlet weak var uitableview: UITableView!
    @IBOutlet weak var msg: UITextField!
    @IBOutlet weak var messagelabel: UITextField!
    @IBOutlet weak var senbutton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        senbutton.clipsToBounds = true
        senbutton.layer.cornerRadius = 5
        

        if isConnectedToNetwork() == true {
            print("Internet connection FAILED")
            let alertController = UIAlertController(title: "Message", message: "This room is public. Everyone can see your query.", preferredStyle: .alert)
            self.present(alertController, animated: true, completion:nil)
            let OKAction = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction) in
                print("You've pressed OK button");
            }
            alertController.addAction(OKAction)
        } else
        {
            print("Internet connection FAILED")
            let alertController = UIAlertController(title: "Error", message: "No internet connection", preferredStyle: .alert)
            self.present(alertController, animated: true, completion:nil)
            let OKAction = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction) in
                print("You've pressed OK button");
            }
            alertController.addAction(OKAction)
        }
        let border = CALayer()
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = UIColor.clear
        self.messagelabel.delegate = self;
        let width = CGFloat(2.0)
        let databaseRef = FIRDatabase.database().reference()
        databaseRef.child("queries").queryOrderedByKey().observe(.childAdded) { (snapshot : FIRDataSnapshot) in
            let snapshotValue = snapshot.value as? Dictionary<String, Any>
            let message = snapshotValue!["msg"] as! String
            let name = snapshotValue!["name"] as! String
            let firstChar = "\(name[name.startIndex])"
            self.posts.insert(postStruct(message:  message ,name: firstChar.uppercased()), at: 0)
            self.uitableview.reloadData()
        }

        border.borderColor = UIColor.black.cgColor
        border.frame = CGRect(x: 0, y: msg.frame.size.height-width, width:  msg.frame.size.width, height: msg.frame.size.height)
        
        border.borderWidth = width
        msg.layer.addSublayer(border)
        msg.layer.masksToBounds = true
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
      func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "mcell", for: indexPath) as! MessageTableViewCell
        cell.nameLabel.clipsToBounds=true
        cell.nameLabel.layer.cornerRadius=cell.nameLabel.frame.size.height/2
        cell.nameLabel.text = posts[indexPath.row].name
        cell.messageLabel.text = posts[indexPath.row].message
       
        return cell
    }
    func post()
    {   let defaults = UserDefaults.standard
        let post : [String : String] = ["msg" : messagelabel.text!, "name" : defaults.string(forKey: "username")!]
        let databaseRef = FIRDatabase.database().reference()
        databaseRef.child("queries").childByAutoId().setValue(post)

    }

    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        uitableview.reloadData()
        return nil
    }
    @IBAction func sendButtonPressed(_ sender: AnyObject) {
        if messagelabel.text == ""{
            print ("Tested")
            uitableview.reloadData()

        }
        else {
            post()
        }
        uitableview.reloadData()
    }
    
    internal func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    func dismissKeyboard() {
        senbutton.resignFirstResponder()
        
    }
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }

    func isConnectedToNetwork() -> Bool {
        
        var zeroAddress = sockaddr_in()
        zeroAddress.sin_len = UInt8(MemoryLayout<sockaddr_in>.size)
        zeroAddress.sin_family = sa_family_t(AF_INET)
        
        guard let defaultRouteReachability = withUnsafePointer(to: &zeroAddress, {
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {
                SCNetworkReachabilityCreateWithAddress(nil, $0)
            }
        }) else {
            return false
        }
        
        var flags: SCNetworkReachabilityFlags = []
        if !SCNetworkReachabilityGetFlags(defaultRouteReachability, &flags) {
            return false
        }
        
        let isReachable = flags.contains(.reachable)
        let needsConnection = flags.contains(.connectionRequired)
        
        return (isReachable && !needsConnection)
    }
    
    func moveTextField(textField: UITextField, moveDistance:  Int, up: Bool){
        let moveDuration = 0.3
        let movement: CGFloat = CGFloat(up ? moveDistance: -moveDistance)
        
        UIView.beginAnimations("animateTextField", context: nil)
        UIView.setAnimationBeginsFromCurrentState(true)
        self.view.backgroundColor = UIColor.white
        UIView.setAnimationDuration(moveDuration)
        self.view.frame = self.view.frame.offsetBy(dx: 0 , dy: movement)
        self.view.backgroundColor = UIColor.gray
        UIView.commitAnimations()
        
        
        
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        moveTextField(textField: textField, moveDistance: -250, up: true)
        
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        moveTextField(textField: textField, moveDistance: -250, up: false)
    }
    private func textFieldShouldReturn(textField: UITextField) -> Bool{
        textField.resignFirstResponder()
        return true
    }

}
