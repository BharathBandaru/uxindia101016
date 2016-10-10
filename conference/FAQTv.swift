  //
  //  FAQTv.swift
  //  conference
  //
  //  Created by Laxmi Rekha on 08/09/16.
  //  Copyright © 2016 ux. All rights reserved.
  //
  
  import UIKit
  
  class FAQTv: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    /*
     // Only override drawRect: if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func drawRect(rect: CGRect) {
     // Drawing code
     }
     */
    let cellIdentifier = "pcell"
     var colorcodes: [UInt] = [0x5482FF,0x88C428,0xF54F28,0xF547C0,0x5482FF,0x88C428,0xF54F28,0xF547C0,0x5482FF,0x88C428,0xF54F28,0x88C428,0xF54F28,0x5482FF,0x88C428];
    var ques = ["How can i book my hotel accommodation?","How do I get my conference delegate pass if I already registered for the event?","How do I reach the venue?","Do I need to carry my laptop/ any other material?","Will I get a certificate of participation if I attend workshop/conference?"," I think I have paid twice, what should I do?","I need an invoice before I pay, what should I do?"," Can I register at the venue?","How do I become a volunteer?"," What if I need to cancel my registration/send some one else in my place?","How can I choose one workshop among the parallelly happening workshops?","What is the dress code for the conference?"]
    var ans = ["Please go through the hotels in our site and book your hotel by using the discount code UXINDIA16","Go to http://www.meraevents.com/ and  print your tickets with your registration no and email id." ,"check map option in this app",
               "Laptop is optional, but you must carry your ticket with you and if you are a student, you must carry your college id card along with your ticket.Laptop is optional, but you must carry your ticket with you and if you are a student, you must carry your college id card along with your ticket.Laptop is optional, but you must carry your ticket with you and if you are a student, you must carry your college id card along with your ticket.","Yes. You will get a certificate only for the workshop.","Send a mail to uxindia@usabilitymatters.org with both the transaction details. We will help you out.","Send a mail to uxindia@usabilitymatters.org with delegate details and with the details to whom the invoice should be raised to.",
               "Yes. You can register at the venue. It costs INR 15,000 per delegate, and we have only 10 passes which will be filled by First come first serve basis.","go to website to register as volunteer and update your strengths, interests and contact info.","For cancellations received before October 1, 2016, registration fees will be refunded at 50%." +
                "Cancellations received on October 1, 2016 or later will not be eligible for a refund" +
                "No refunds will be given for No Shows" +
        "Transfers: Registrations are transferable, we require notice of such in writing, a minimum of 5days prior to the event","We will circulate a form to choose the workshops you want by 1st Oct 2016 and the workshops rooms which will be filled by First come first serve basis.","No dress code however it's advised to be presentable in the professional gathering."]
    // cell reuse id (cells that scroll out of view can be reused)
    
    // don't forget to hook this up from the storyboard
    @IBOutlet var tableView: UITableView!
    var valueToPass : String?
    var valueToPass2 : String?
    var valueToPass3 : UInt?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.layoutIfNeeded()
        
        // Register the table view cell class and its reuse id
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = UIColor.clear
        
        self.tableView.register(FAQTableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        
        // This view controller itself will provide the delegate methods and row data for the table view.
        
    }
    /* func UIColorFromRGB(_ rgbValue: UInt) -> UIColor {
     return UIColor(
     red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
     green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
     blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
     alpha: CGFloat(1.0)
     )
     }*/
    
    // number of rows in table view

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.ques.count
    }
    
    // create a cell for each table view row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // create a new cell if needed or reuse an old one
        
        let cell:FAQTableViewCell = self.tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as! FAQTableViewCell!
        // set the text from the data model
        cell.h1?.text = ques[(indexPath as NSIndexPath).row]
        cell.h2?.text = ans[(indexPath as NSIndexPath).row]
        cell.colorbar.backgroundColor = UIColorFromRGB(colorcodes[(indexPath as NSIndexPath).row] )
        
        return cell
    }
    func UIColorFromRGB(_ rgbValue: UInt) -> UIColor {
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    // method to run when table view cell is tapped
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You tapped cell number \((indexPath as NSIndexPath).row).")
        let indexPath = tableView.indexPathForSelectedRow!
        let pcell = tableView.cellForRow(at: indexPath) as! FAQTableViewCell
        valueToPass = pcell.h1.text
        valueToPass2 = pcell.h2.text
        valueToPass3 = colorcodes[indexPath.row]
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "faqdetails", sender: pcell)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("here")
        if segue.identifier == "faqdetails" {
            let backItem = UIBarButtonItem()
            backItem.title = "Back"
            navigationItem.backBarButtonItem = backItem
            let destinationVC = segue.destination as! FaqDetailViewController
            destinationVC.store = valueToPass!
            destinationVC.store2 = valueToPass2!
            destinationVC.store3 = valueToPass3!


        }
        
    }

  }
