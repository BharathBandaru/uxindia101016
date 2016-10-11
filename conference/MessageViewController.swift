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

struct postStruct {
    let message  : String!
    let name : String!
}

class MessageViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var posts = [postStruct]()
    @IBOutlet weak var uitableview: UITableView!
    @IBOutlet weak var msg: UITextField!
    @IBOutlet weak var messagelabel: UITextField!
    @IBOutlet weak var senbutton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        senbutton.clipsToBounds = true
        senbutton.layer.cornerRadius = 5
        let border = CALayer()
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = UIColor.clear
        

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
        }
        else {
            post()
        }
        uitableview.reloadData()
    }

}
