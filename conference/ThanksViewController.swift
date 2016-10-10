//
//  ThanksViewController.swift
//  conference
//
//  Created by Bharath Bandaru on 10/10/16.
//  Copyright © 2016 ux. All rights reserved.
//

import UIKit
import Social
import SystemConfiguration

class ThanksViewController: UIViewController {
    
    @IBOutlet weak var facebookconnect: UIButton!
    @IBOutlet weak var tweetButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.layoutIfNeeded()
        facebookconnect.clipsToBounds = true
        facebookconnect.layer.cornerRadius = 5
        tweetButton.clipsToBounds = true
        tweetButton.layer.cornerRadius = 5
        // Do any additional setup after loading the view.
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
    @IBAction func submitTweet(_ sender: AnyObject) {
        if isConnectedToNetwork() == true {
            print("Internet connection OK")
         
            //tweetSLCVC()
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

    
}
    



