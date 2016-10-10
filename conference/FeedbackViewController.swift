//
//  FeedbackViewController.swift
//  conference
//
//  Created by Bharath Bandaru on 05/10/16.
//  Copyright © 2016 ux. All rights reserved.
//
import Social
import UIKit
import Firebase
import FirebaseDatabase
import SystemConfiguration

class FeedbackViewController: UIViewController {
    
    @IBOutlet weak var faceButton: UIButton!
    @IBOutlet weak var twitterButton: UIButton!
    @IBOutlet weak var uireview: UITextField!
    @IBOutlet weak var submit_UiBut: UIButton!
   // var ref: FIRDatabaseReference!
    @IBOutlet weak var rate_learn: CosmosView!
    @IBOutlet weak var rate_exp: CosmosView!
    @IBOutlet weak var scrollview: UIScrollView!
    var contentView: UIView!
    var rate1: Double = 5.0
    var rate2: Double = 5.0
    var review: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.layoutIfNeeded()
        faceButton.clipsToBounds = true
        faceButton.layer.cornerRadius = 5
        twitterButton.clipsToBounds = true
        twitterButton.layer.cornerRadius = 5
        submit_UiBut.clipsToBounds = true
        submit_UiBut.layer.cornerRadius = 5
        
       // ref = FIRDatabase.database().reference()
        rate_learn.didFinishTouchingCosmos = { rating in
            print("rating :\(rating)")
            self.rate2 = rating
        }
        rate_exp.didFinishTouchingCosmos = { rating in
            print("rating :\(rating)")
            self.rate1 = rating
        }
        if isConnectedToNetwork() == true {
            print("Internet connection OK")
           
        } else {
            print("Internet connection FAILED")
            let alertController = UIAlertController(title: "Error", message: "No internet connection", preferredStyle: .alert)
            self.present(alertController, animated: true, completion:nil)
            let OKAction = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction) in
                print("You've pressed OK button");
            }
            alertController.addAction(OKAction)
        }
        
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
    func post()
    {   review = uireview.text!
        let post : [String : String] = ["experience" : "\(rate1)","learning" : "\(rate2)", "feedback" : review]
        let databaseRef = FIRDatabase.database().reference()
          let defaults = UserDefaults.standard
        databaseRef.child(defaults.string(forKey: "username")!).setValue(post)

    }
    func tweet()
    {
        if SLComposeViewController.isAvailable(forServiceType: SLServiceTypeTwitter){
            let twitterController:SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeTwitter)
            twitterController.setInitialText("Posting a tweet from iOS App" + "\r\n" + "\r\n" + "#Cool")
            self.present(twitterController, animated: true, completion: nil)
        } else {
            let alertController = UIAlertController(title: "Twitter Account", message: "Please login to your Twitter account.", preferredStyle: .alert)
            self.present(alertController, animated: true, completion:nil)
            let OKAction = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction) in
                print("You've pressed OK button");
            }
            alertController.addAction(OKAction)
        }
        
        
    }
    func facebook()
    {
        if SLComposeViewController.isAvailable(forServiceType: SLServiceTypeFacebook){
            let facebookSheet:SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
            facebookSheet.setInitialText("Share on Facebook")
            self.present(facebookSheet, animated: true, completion: nil)
        } else {
            let alert = UIAlertController(title: "Accounts", message: "Please login to a Facebook account to share.", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    @IBAction func FaceAction(_ sender: AnyObject) {
        facebook()
    }
    @IBAction func tweetButton(_ sender: AnyObject) {
        tweet()
    }
    @IBAction func SubmitRating(_ sender: AnyObject) {
        if isConnectedToNetwork() == true {
            print("Internet connection OK")
            post()
           
            
        } else {
            print("Internet connection FAILED")
            let alertController = UIAlertController(title: "Error", message: "No internet connection", preferredStyle: .alert)
            self.present(alertController, animated: true, completion:nil)
            let OKAction = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction) in
                print("You've pressed OK button");
            }
            alertController.addAction(OKAction)
        }

    }

   // self.ref.child("feed").child("feedID")
}
