//
//  SecondViewController.swift
//  conference

//  Created by Bharath Bandaru on 22/08/16.
//  Copyright © 2016 ux. All rights reserved.
//

import UIKit


class ScheduleViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchResultsUpdating,UISearchBarDelegate,CustomSearchControllerDelegate
{
    
    @IBOutlet weak var myHeader: CustomHeaderCell!
    
    
    @IBOutlet weak var myHeadView: UIView!
    @IBOutlet weak var uxtableview: UITableView!
    var searchController: UISearchController!
    var customSearchController: CustomSearchController!
    
    var shouldShowSearchResults = false
    var timings = ["8:00 AM - 8:30 AM","8:30 AM - 9:30 AM","9:30 AM - 10:00 AM","10:00 AM - 10:30 AM","10:45 AM - 11:45 AM","11:45 AM - 12:15 PM","12:15 PM - 12:45 PM","13:45 PM - 14:45 PM","14:45 PM - 15:05 PM","15:05 PM - 15:35 PM","15:50 PM - 16:20 PM","16:20 PM - 16:50 PM","16:50 PM - 17:20 PM","18:30 PM"]
    var submatters = ["","Bapu Kaladhar is a Strategic Design Thinker and Information Architect. He is most interested in incubating new business models that deliver social impact,","Kalvakuntla Taraka Rama Rao popularly known as KTR, is an Indian politician from the Telangana state . He currently serves as the Cabinet Minister for the State for three different portfolios namely Information Technology (IT), Panchayat Raj and​ ​ Municipal Administration and Urban Development.","Jay Peters is the Managing Director of PARK USA, a world leading design & innovation management consulting firm, and Managing Director of Grow USA, a world leading professional education provider in Design","","Satish Ramachandran is the Global head of design at Nutanix where he is dedicated to applying design to reimagine enterprise computing.","Andrew is CEO and Product Manager of Optimal Workshop. Their tools are used and loved by information architects, designers and","","The Digital Product Design field has been going through an identity crisis for almost 20 years. It's about time we try to make sense of it.","","What has brought accolades to YUJ Designs is the way Prasadd drives user research, interaction design and visual design with equal zest and excellence.","","Jeremy has over 20 years of experience in design, particularly around human interactions and user experience, fostering collaborative",""]
    //var roomsnos = ["ROOM : Aura 2","ROOM : Harmony","ROOM : Aura 2"]
    var breaks = ["9:00 am","10:00 am","11:00 am"]
    let imageName = ["registration","kb.jpg","ktr_uxindia","Jay_Peter_uxidia","Discussion","satish_uxindia","Andrew_Mayfield_uxindia","Discussion","Marcelo_Paiva_uxindia","Music","prasad_uxindia","","Jeremy_Yuille_uxindia","Close"]
    //var colorcodes : [UInt] = [0x43ACD4,0xDA2265,0x5BC7AF]
    var noofrows : [Int] = [1,1,1,4,1,20,9,1]
    var noofrows1 : [Int] = [1,1,1,5,1,4,1,1]
    
    var imagenames = ["","BAPU KALADHAR","K. T. RAMA RAO","JAY PETERS", "","SATISH RAMACHANDRAN","ANDREW MAYFIELD","","MARCELO PAIVA","","PRASADD BARTAKKE","DHEERAJ BATRA","JEREMY YUILLE",""]
    var headings = ["REGISTRATIONS","Opening Remarks","Honorable IT Minister,Telangana State","Managing & Leading Design Impact","DESIGN STARTUP","Reimagining Enterprise computing using Design","","INDUSTRY ACADEMIA FUSION","Impacting Organizations through proper Design practices education.","Program","","","","CLOSING REMARKS"]
    var section3colorcodes : [UInt] = [0x6699ff,0x99cc33,0xff6633,0xff66cc]
    
    
    
    var filterdArray : [String]? = []
    var headings1 = ["REGISTRATIONS","Opening Remarks","WOMEN IN DESIGN","","UX Clinic","","","CLOSING REMARKS"]
    var section3headings = ["Leadership Track","Advanced Track","Essentials Track","Women in Design Track"]
    var section5headings = ["Driving UX in an insurance company","Design, Develop and SURVIVE","Improving overall experience of an Enterprise Platform by Evidence and Research based design","Driving Design Thinking in Enterprise Products","Standing Strong: Leading Business By Design","Impact of Inclusive Design - beyond disabilities","Assistive Technology and UX","Design Intervention- How the industry evolved with it?","Building a great UX team: The hiring experience","Design Thinking - Getting From There to Here","","The Design Sprint - Transforming Constraints into Catalysts for Creativity and Innovation","Using UX to design user led furniture","Data Visualization Aiding Not Just Super Heroes","“Creating delightful human experiences | Social Centered design approach to impact people & Communities","Change by Design – A Woman-Centric Way of Driving the Design Culture","Design as Social Capital","'TOD' : A UX Pillar that helps in designing for decision makers","Progressive Web Applications - What to keep in mind","Women Entrepreneur in Design"]
    var section6headings = ["UX ESSENTIALS","Title","A Case of Strategic Design","Designers - Think Rural!","UX MASTERY","","","Designing for Humans - Responsibly","UX VISIONARY"]
    var timings1 = ["8:00 AM - 9:00 AM","9:00 AM - 9:30 AM","9:30 AM - 10:00 AM","10:30 AM - 13:00 AM","10:30 AM - 13:00 PM","14:00 PM - 16:30 PM","16:45 PM - 18:15 PM","18:30 PM"]
    var imagename1 = ["registration","kb","Discussion","","Clinic","","","Close"]
    var section3imagesname1 = ["Jeremy_Yuille_uxindia","lakshman_uxindia","Marcelo_Paiva_uxindia","shaun_uxindia"]
    var section5imagesname1 = ["kevin_uxindia","Naveen_Magmain_uxindia","Abinaya_Palaniappan_uxindia","madhuri_uxindia","Aditi_Agarwal_uxindia","Srinivasu_Chakravartula_uxindia","Chandni_Rajendran_uxindia","Neha_Modgil_uxindia","Pradeep_Joseph_uxindia","mario_uxindia","ranjeet_uxindia","Niharika_Manchanda_uxindia","Kranti_M_uxindia","Balakrishna_Chamola_uxindia","Prashanth_Shanmugam_uxindia","Prachi_Sakhardande_uxindia","Kshitiz_Anand_uxindia","Prashant_Dixit_uxindia","Rahul_Rout_uxindia","Chaitrali_Dhole_uxindia"]
    var section6imagesname1 = ["Discussion","user","Srinivas_Chinta_uxindia","Muzayun_uxindia","Discussion","narender_uxindia","shyam_uxindia","sirajuddin_uxindia","Discussion"]
    
    var imagenames1 = ["","BAPU KALADHAR","","","","","",""]
    var section3imagesnames1 = ["Jeremy Yuille","Lakshman Pachineela","MARCELO PAIVA","Shaun Wortis"]
    var section5imagesnames1 = ["KEVIN BOEZENNEC","NAVEEN MAGMAIN","ABINAYA LANIAPPAN","Madhuri Kolhatkar","ADITI AGARWAL","SRINIVASU CHAKRAVARTULA","CHANDNI RAJENDRAN","NEHA MODGIL","PRADEEP JOSEPH","Mario Van der Meulen","RANJEET","NIHARIKA MACHANDA","KRANTI M","BALAKRISHNA CHOMLA","PRASHANTH SHANMUGAM","PRACHI SAKHARDANDE","KSHITIZ ANAND","PRASHANT DIXIT","RAHUL ROUT","CHITRALI DHOLE"]
    var section5colorcodes : [UInt] = [0x6699ff,0x99cc33,0xff6633,0xff66cc,0x6699ff,0x99cc33,0xff6633,0xff66cc,0x6699ff,0x99cc33,0xff6633,0xff66cc,0x6699ff,0x99cc33,0xff6633,0xff66cc,0x6699ff,0x99cc33,0xff6633,0xff66cc]
    
    var section6imagesnames1 = ["","","SRINIVAS CHINTA","MUZAYUN MUKHTAR","","NARENDER GANGAPURI","SHYAM DURISETI","SIRAJUDDIN MUSTAFA",""]
    var section6colorcodes  : [UInt] = [0x6699ff,0x99cc33,0xff6633,0x6699ff,0x99cc33,0xff6633,0x6699ff,0x99cc33,0xff6633]
    
    var submatters1 = ["","Bapu Kaladhar is a Strategic Design Thinker and Information Architect. He is most interested in incubating new business models that deliver social impact","","","BOARD ROOM","","","DAY CLOSES"]
    var section3submatters1 = ["Workshop 01","Workshop 02","Workshop 03","Workshop 04"]
    var section5submatters1 = ["I practice User Experience design to solve solutions to complex problems.As an athletic individual, I understand the concept of working hard through the obstacles and challenges that lay ahead to achieve the goals I have set for myself.\n","Inspired by the power of interfaces design and driven to improve the user experience. Strong on new ideas and an advocate of user centric designs.","Part of BNY Mellon User Experience team - specialized and hands on experience in User Experience Design and Design Management. Strongly believe that Design solutions can make the world a better place to live in.","A design thought leader with 30 years of experience as a usability practitioner and design manager,","Hi! My name is Aditi Agarwal. I work as Creative Director with Singsys. I am an User Interface Designer . Having 5 years experience in design industry under my belt","Srinivasu Chakravarthula – studied in the area of Computer Science and digital accessibility and is certified in ‘assistive technologies","Chandni Rajendran is a graduate student of Interaction Design at IDC School of Design, IIT Bombay, class of 2017. Her research","Neha Modgil, through her love for UX design has set a commendable benchmark as a woman entrepreneur. Beginning her journey","Mr. Pradeep Joseph is leading the Bosch UX Studio in Bangalore, India. Mr. Joseph has over 18 years of experience in the area","Mario is a creative who’s able to see what others are saying. A versatile, ambidextrous designer able to think strategically and execute ","Ranjeet Tayi is a passionate product User Experience designer & design thinker with over 13 years of experience designing world class","Niharika Manchanda is a User Experience Design Specialist for SAP Labs for Asia Pacific and Japan, where she drives the user ","A serial entrepreneur in the design space with 15+ years. See www.uxdesignlabs.com and www.furlenco.com for work done. A design mentor at Google","I’m a User Experience(UX) professional with 15 years combined experience in UX Solution Architecting, Information Visualization ","Prashanth works as a User Experience Designer for Verizon’s Technical Operations and Development Center. He holds more than three","Prachi Sakhardande heads a Product Experience group for a Product Engineering division of TATA Consultancy Services. ","Kshitiz is a passionate designer, educator and public speaker. His approach is firmly grounded in applying the principles of ","Having worked in a range of roles within the realm of User Experience Design and Research, I have acquired about 9 years ","I have been working on building a PWA for the last seven months. Have gone through","9+ years of experience in designing experiences across variety of domains. \n Current focus on UX for Networking & Security"]
    var section6submatters1 = ["","UX Ladder","I am a UX practitioner and the Chief Designer at Divami Design Labs, a User Experience company that I co-founded seven years ago.","Muzayun Mukhtar is passionate about technological interventions in complex social problems","UX Ladder","Narender has 18+ years of experience in Design with an ability to envision futuristic products with delighted customer experience.","Mr. Duriseti is a customer experience manager at Citrix Systems Inc. He's worked with enterprises","Siraj is a human experience designer at heart, been a founder & co-founder of startups","UX Ladder"]
    
    //    var roomsnos1 = ["ROOM : Harmony","ROOM : Aura 2","ROOM : Aura 2"]
    
    var timings2 = ["8:00 AM - 9:00 AM","9:00 AM - 9:30 AM","9:30 AM - 10:00 AM","10:20 AM - 13:00 AM","10:20 AM - 13:00 PM","14:00 PM - 16:30 PM","16:30 PM - 17:00 PM","17:00 PM - 18:00 PM"]
    var headings2 = ["REGISTRATIONS","Design Leadership, a career path for brave souls","headingsteve","","UX Clinic","","UX Clinic","VOTE OF THANKS"]
    var section3heading2 = ["Leadership Track","Advanced Track","Essentials Track","Women in Design Track","Women in Design Track"]
    var section5heading2 = ["Leadership Track","Advanced Track","Essentials Track","Women in Design Track"]
    var submatters2 = ["","Director of User Experience Design with 20 years of creative leadership gained in Europe","Steve Fadden works as a user researcher with Analytics User Experience at Salesforce. He also serves as a lecturer at the School of Information","","BOARD ROOM","","BOARD ROOM",""]
    let section3submatters2 = ["The Value of Design","","","",""]
    let section5submatters2 = ["Workshop 09","Workshop 10","Design Leadership, a career path for brave souls","Workshop 12"]
    //var roomsnos2 = ["ROOM : Harmony","ROOM : Aura 2","ROOM : Aura 2"]
    let imageName2 = ["registration","Pablo_Sanchez_Martin_uxindia","Steve_Faden_uxindia","","","","","Close"]
    let section3imageName2 = ["Jay_Peter_uxidia","Steve_Faden_uxindia","kevin_uxindia","robert_uxindia","stuart_uxindia"]
    let section5imageName2 = ["user","Andrew_Mayfield_uxindia","Pablo_Sanchez_Martin_uxindia","madhuri_uxindia"]
    
    
    var imagenames2 = ["","Pablo Sanchez Martin","STEVE FADDEN","","","","",""]
    let section3imagenames2 = ["JAY PETERS","STEVE FADDEN","KEVIN BOEZENNEC","Robert Newham","Stuart Trevithick"]
    let section5imagenames2 = ["DHEERAJ BATRA","ANDREW MAYFIELD","Pablo Sanchez Martin","Madhuri Kolhatkar"]
    var section3colorcodes1 : [UInt] = [0x6699ff,0x99cc33,0xff6633,0xff66cc,0xff66cc]
    var section5colorcodes1 : [UInt] = [0x6699ff,0x99cc33,0xff6633,0xff66cc]
    @IBOutlet weak var but22: UIButton!
    @IBOutlet weak var but21: UIButton!
    var valueToPass : String?
    var valueToPass3 : String?
    var valueToPass2 : String?
    var valueToPass1 : String?
    @IBOutlet weak var datalabel: UILabel!
    @IBOutlet weak var but20: UIButton!
    @IBAction func Act22(_ sender: AnyObject) {
        datalabel.text="Saturday, 22 Oct"
        but20.backgroundColor=UIColor.clear
        but21.backgroundColor=UIColor.clear
        but22.backgroundColor=UIColorFromRGB(0xFF5A00)
        uxtableview.reloadData()
        
    }
    @IBAction func Act21(_ sender: AnyObject) {
        datalabel.text="Friday, 21 Oct"
        but20.backgroundColor=UIColor.clear
        but22.backgroundColor=UIColor.clear
        but21.backgroundColor=UIColorFromRGB(0xFF5A00)
        uxtableview.reloadData()
        
        
    }
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.view.layoutIfNeeded()
        uxtableview.reloadData()
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = UIColor.clear
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(ScheduleViewController.respondToSwipeGesture(_:)))
        swipeRight.direction = UISwipeGestureRecognizerDirection.right
        self.view.addGestureRecognizer(swipeRight)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(ScheduleViewController.respondToSwipeGesture(_:)))
        swipeLeft.direction = UISwipeGestureRecognizerDirection.left
        self.view.addGestureRecognizer(swipeLeft)
        datalabel.text="Thursday, 20 Oct"
        but20.clipsToBounds=true
        but20.layer.cornerRadius=but20.frame.size.height/2
        but21.clipsToBounds=true
        but21.layer.cornerRadius=but20.frame.size.height/2
        but22.clipsToBounds=true
        but22.layer.cornerRadius=but20.frame.size.height/2
        uxtableview.rowHeight = UITableViewAutomaticDimension
        uxtableview.estimatedRowHeight = 140
        uxtableview.delegate = self
        uxtableview.dataSource = self
        configureCustomSearchController()
        
        
    }
    func updateSearchResults(for searchController: UISearchController) {
        guard let searchString = searchController.searchBar.text else {
            return
        }
    }
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        shouldShowSearchResults = true
        uxtableview.reloadData()
    }
    
    func configureCustomSearchController() {
        customSearchController = CustomSearchController(searchResultsController: self, searchBarFrame: CGRect(x: 0.0, y: 0.0, width: uxtableview.frame.size.width, height: 50.0), searchBarFont: UIFont(name: "Futura", size: 16.0)!, searchBarTextColor: UIColor.orange, searchBarTintColor: UIColor.black)
        
        customSearchController.customSearchBar.placeholder = "Search for speakers.."
        uxtableview.tableHeaderView = customSearchController.customSearchBar
        
        customSearchController.customDelegate = self
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        shouldShowSearchResults = false
        uxtableview.reloadData()
    }
    
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print("clicked")
        if !shouldShowSearchResults {
            shouldShowSearchResults = true
            uxtableview.reloadData()
        }
        
        searchController.searchBar.resignFirstResponder()
    }
    
    func configureSearchController() {
        // Initialize and perform a minimum configuration to the search controller.
        searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search here..."
        searchController.searchBar.delegate = self
        searchController.searchBar.sizeToFit()
        
        // Place the search bar view to the tableview headerview.
        uxtableview.tableHeaderView = searchController.searchBar
    }
    
    override func viewDidAppear(_ animated: Bool) {
        uxtableview.reloadData()
        
    }
    func UIColorFromRGB(_ rgbValue: UInt) -> UIColor {
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    func respondToSwipeGesture(_ gesture: UIGestureRecognizer) {
        
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            
            
            switch swipeGesture.direction {
            case UISwipeGestureRecognizerDirection.right:
                uxtableview.reloadData()
                if but20.backgroundColor != UIColor.clear{
                    but20.backgroundColor=UIColor.clear
                    but21.backgroundColor=UIColorFromRGB(0xFF5A00)
                    datalabel.text="Friday, 21 Oct"
                    
                }
                else{
                    but21.backgroundColor=UIColor.clear
                    but22.backgroundColor=UIColorFromRGB(0xFF5A00)
                    datalabel.text="Saturday, 22 Oct"
                    
                }
            case UISwipeGestureRecognizerDirection.left:
                uxtableview.reloadData()
                if but20.backgroundColor == UIColor.clear{
                    if but22.backgroundColor != UIColor.clear{
                        but22.backgroundColor=UIColor.clear
                        but21.backgroundColor=UIColorFromRGB(0xFF5A00)
                        datalabel.text="Friday, 21 Oct"
                        
                    }
                    else{
                        but21.backgroundColor=UIColor.clear
                        but20.backgroundColor=UIColorFromRGB(0xFF5A00)
                        datalabel.text="Thursday, 20 Oct"
                        
                    }
                }
            default:
                break
            }
        }
    }
    @IBAction func Act20(_ sender: AnyObject) {
        datalabel.text="Thursday, 20 Oct"
        but21.backgroundColor=UIColor.clear
        but22.backgroundColor=UIColor.clear
        but20.backgroundColor=UIColorFromRGB(0xFF5A00)
        uxtableview.reloadData()
        
    }
    
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        
        
        //        if imagenames[(indexPath as NSIndexPath).section]  == ""
        //        {
        //            return nil
        //        }
        //    else if imagenames1[(indexPath as NSIndexPath).section] != "" || section3imagesnames1[(indexPath as NSIndexPath).row] != "" || section5imagesnames1[(indexPath as NSIndexPath).row] != "" || section6imagesnames1[(indexPath as NSIndexPath).row] != ""{
        //                      return indexPath
        //                }
        //        else if imagenames2[(indexPath as NSIndexPath).section] != "" || section3imagenames2[(indexPath as NSIndexPath).row] != "" || section5imagenames2[(indexPath as NSIndexPath).row] != ""{
        //            return indexPath
        //        }
        //        else{
        return indexPath
        //        }
    }
    
    // MARK: - Table view data source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // 1
        // Return the number of sections.
        if but20.backgroundColor != UIColor.clear{
            return timings.count
        }
        else if but21.backgroundColor != UIColor.clear{
            return timings1.count
        }
        else{
            return noofrows1.count
        }
        
    }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // 2
        if but20.backgroundColor != UIColor.clear{
            return 1
        }
        else if but21.backgroundColor != UIColor.clear{
            return noofrows[section]
        }
        else{
            return noofrows1[section]
        }
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        
        if but20.backgroundColor != UIColor.clear{
            if timings[section] == "10:00 AM - 10:30 AM"
            {
                print("one")
                return 40.0
            }
            else if timings[section] == "12:15 PM - 12:45 PM"{
                print("two")
                
                return 40.0
                
            }
            else if timings[section] == "14:45 PM - 15:05 PM" {
                print("three")
                
                return 40.0
            }
            else {
                print("zero")
                
                return 0
            }
        }
        else if but21.backgroundColor != UIColor.clear{
            if timings1[section] == "9:30 AM - 10:00 AM"
            {
                print("one")
                return 40.0
            }
            else if timings1[section] == "10:30 AM - 13:00 PM"{
                print("two")
                
                return 40.0
                
            }
            else if timings1[section] == "14:00 PM - 16:30 PM" {
                print("three")
                
                return 40.0
            }
            else {
                print("zero")
                
                return 0
            }
            
        }
        else{
            if timings2[section] == "9:30 AM - 10:00 AM"
            {
                print("one")
                return 40.0
            }
            else if timings2[section] == "10:20 AM - 13:00 PM"{
                print("two")
                
                return 40.0
                
            }
            else if timings2[section] == "14:00 PM - 16:30 PM" {
                print("three")
                
                return 40.0
            }
            else {
                print("zero")
                
                return 0
            }
            
        }
    }
    
    func didStartSearching() {
        shouldShowSearchResults = true
        uxtableview.reloadData()
    }
    func didTapOnSearchButton() {
        if !shouldShowSearchResults {
            shouldShowSearchResults = true
            uxtableview.reloadData()
        }
    }
    
    
    func didTapOnCancelButton() {
        shouldShowSearchResults = false
        uxtableview.reloadData()
    }
    func didChangeSearchText(_ searchText: String) {
        // Filter the data array and get only those countries that match the search text.
        filterdArray = imagenames.filter({ (country) -> Bool in
            let countryText: NSString = country as NSString
            
            return (countryText.range(of: searchText, options: NSString.CompareOptions.caseInsensitive).location) != NSNotFound
        })
        
        // Reload the tableview.
        uxtableview.reloadData()
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! MatterTableViewCell
        tableView.estimatedRowHeight = 100.0;
        tableView.rowHeight = UITableViewAutomaticDimension
        
        // 3
        // Configure the cell...
        if but20.backgroundColor != UIColor.clear{
            print("but 20")
            
            cell.heading?.text = headings[(indexPath as NSIndexPath).section]
            cell.matter?.text = submatters[(indexPath as NSIndexPath).section]
            //cell.roomno?.text = roomsnos[(indexPath as NSIndexPath).section]
            cell.imgv.image = UIImage(named: imageName[(indexPath as NSIndexPath).section])
            cell.imgname?.text = imagenames[(indexPath as NSIndexPath).section]
            
        }
            /*
             cell.matter?.text = submatters[(indexPath as NSIndexPath).section]
             //cell.roomno?.text = roomsnos[(indexPath as NSIndexPath).section]
             cell.imgname?.text = imagenames[(indexPath as NSIndexPath).section]
             
             cell.imgv.image = UIImage(named: imageName[(indexPath as NSIndexPath).section])
             cell.heading?.text = headings[(indexPath as NSIndexPath).section]
             
             
             */
            
            // cell.colorbar.backgroundColor = UIColorFromRGB(colorcodes[(indexPath as NSIndexPath).row])
            /*
             if but20.backgroundColor != UIColor.clear{
             print("but 20")
             
             switch ((indexPath as NSIndexPath).section) {
             case 0:
             cell.heading?.text = headings[(indexPath as NSIndexPath).row]
             cell.matter?.text = submatters[(indexPath as NSIndexPath).row]
             cell.roomno?.text = roomsnos[(indexPath as NSIndexPath).row]
             cell.imgv.image = UIImage(named: imageName[(indexPath as NSIndexPath).row])
             cell.imgname?.text = imagenames[(indexPath as NSIndexPath).row]
             cell.colorbar.backgroundColor = UIColorFromRGB(colorcodes[(indexPath as NSIndexPath).row])
             
             case 1:
             cell.heading?.text = headings[(indexPath as NSIndexPath).row]
             cell.matter?.text = submatters[(indexPath as NSIndexPath).row]
             cell.roomno?.text = roomsnos[(indexPath as NSIndexPath).row]
             cell.imgv.image = UIImage(named: imageName[(indexPath as NSIndexPath).row])
             cell.imgname?.text = imagenames[(indexPath as NSIndexPath).row]
             cell.colorbar.backgroundColor = UIColorFromRGB(colorcodes[(indexPath as NSIndexPath).row])
             
             
             case 2:
             cell.heading?.text = headings[(indexPath as NSIndexPath).row]
             cell.matter?.text = submatters[(indexPath as NSIndexPath).row]
             cell.roomno?.text = roomsnos[(indexPath as NSIndexPath).row]
             cell.imgv.image = UIImage(named: imageName[(indexPath as NSIndexPath).row])
             cell.imgname?.text = imagenames[(indexPath as NSIndexPath).row]
             cell.colorbar.backgroundColor = UIColorFromRGB(colorcodes[(indexPath as NSIndexPath).row])
             
             
             //return sectionHeaderView
             default:
             cell.textLabel?.text = "Other"
             }
             }*/
        else if but21.backgroundColor != UIColor.clear{
            print("but 21")
            switch ((indexPath as NSIndexPath).section) {
            case 3 :
                cell.heading?.text = section3headings[(indexPath as NSIndexPath).row]
                cell.matter?.text = section3submatters1[(indexPath as NSIndexPath).row]
                //cell.roomno?.text = roomsnos[(indexPath as NSIndexPath).section]
                cell.colorbar.backgroundColor = UIColorFromRGB(section3colorcodes[(indexPath as NSIndexPath).row])
                cell.imgv.image = UIImage(named: section3imagesname1[(indexPath as NSIndexPath).row])
                cell.imgname?.text = section3imagesnames1[(indexPath as NSIndexPath).row]
                break
            case 5:
                cell.heading?.text = section5headings[(indexPath as NSIndexPath).row]
                cell.matter?.text = section5submatters1[(indexPath as NSIndexPath).row]
                cell.colorbar.backgroundColor = UIColorFromRGB(section5colorcodes[(indexPath as NSIndexPath).row])
                //cell.roomno?.text = roomsnos[(indexPath as NSIndexPath).section]
                cell.imgv.image = UIImage(named: section5imagesname1[(indexPath as NSIndexPath).row])
                cell.imgname?.text = section5imagesnames1[(indexPath as NSIndexPath).row]
                break
            case 6:
                cell.heading?.text = section6headings[(indexPath as NSIndexPath).row]
                cell.matter?.text = section6submatters1[(indexPath as NSIndexPath).row]
                //cell.roomno?.text = roomsnos[(indexPath as NSIndexPath).section]
                cell.colorbar.backgroundColor = UIColorFromRGB(section6colorcodes[(indexPath as NSIndexPath).row])
                
                cell.imgv.image = UIImage(named: section6imagesname1[(indexPath as NSIndexPath).row])
                cell.imgname?.text = section6imagesnames1[(indexPath as NSIndexPath).row]
                break
            default :
                cell.heading?.text = headings1[(indexPath as NSIndexPath).section]
                cell.matter?.text = submatters1[(indexPath as NSIndexPath).section]
                //cell.roomno?.text = roomsnos[(indexPath as NSIndexPath).section]
                cell.imgv.image = UIImage(named: imagename1[(indexPath as NSIndexPath).section])
                cell.imgname?.text = imagenames1[(indexPath as NSIndexPath).section]
                break
            }
            
        }
        else{
            if but22.backgroundColor != UIColor.clear{
                print("but 22")
                switch ((indexPath as NSIndexPath).section) {
                case 3 :
                    cell.heading?.text = section3heading2[(indexPath as NSIndexPath).row]
                    cell.matter?.text = section3submatters2[(indexPath as NSIndexPath).row]
                    //cell.roomno?.text = roomsnos[(indexPath as NSIndexPath).section]
                    cell.colorbar.backgroundColor = UIColorFromRGB(section3colorcodes1[(indexPath as NSIndexPath).row])
                    cell.imgv.image = UIImage(named: section3imageName2[(indexPath as NSIndexPath).row])
                    cell.imgname?.text = section3imagenames2[(indexPath as NSIndexPath).row]
                    break
                case 5:
                    cell.heading?.text = section5heading2[(indexPath as NSIndexPath).row]
                    cell.matter?.text = section5submatters2[(indexPath as NSIndexPath).row]
                    //cell.roomno?.text = roomsnos[(indexPath as NSIndexPath).section]
                    cell.colorbar.backgroundColor = UIColorFromRGB(section5colorcodes1[(indexPath as NSIndexPath).row])
                    
                    cell.imgv.image = UIImage(named: section5imageName2[(indexPath as NSIndexPath).row])
                    cell.imgname?.text = section5imagenames2[(indexPath as NSIndexPath).row]
                    break
                default :
                    cell.heading?.text = headings2[(indexPath as NSIndexPath).section]
                    cell.matter?.text = submatters2[(indexPath as NSIndexPath).section]
                    //cell.roomno?.text = roomsnos[(indexPath as NSIndexPath).section]
                    cell.imgv.image = UIImage(named: imageName2[(indexPath as NSIndexPath).section])
                    cell.imgname?.text = imagenames2[(indexPath as NSIndexPath).section]
                    break
                }
                
                
            }
        }
        
        return cell
    }
    /*
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     
     // retrieve selected cell & fruit
     
     if let indexPath = uxtableview.indexPathForSelectedRow {
     
     
     let detailViewController = segue.destination as! DetailViewController
     print("matter",submatters1[indexPath.row])
     detailViewController.matter.text = submatters[(indexPath as NSIndexPath).row]
     }
     }*/
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let indexPath = tableView.indexPathForSelectedRow!
        let cell = tableView.cellForRow(at: indexPath) as! MatterTableViewCell
        valueToPass = cell.imgname.text
        if cell.imgname.text == "" {
            valueToPass3 = cell.heading.text
        }
        valueToPass1 = cell.heading.text
        //valueToPass2 = cell.matter.text
        
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "details", sender: cell)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("here")
        if segue.identifier == "details" {
            let backItem = UIBarButtonItem()
            backItem.title = "Back"
            navigationItem.backBarButtonItem = backItem
            
            //Note that, originally, destinationViewController is of Type UIViewController and has to be casted as myViewController instead since that's the ViewController we trying to go to.
            let destinationVC = segue.destination as! DetailViewController
            
            destinationVC.store = valueToPass!
            destinationVC.store2 = valueToPass1!
            //destinationVC.store3 = valueToPass2!
            
            
        }
        
    }
    
    
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let  headerCell = tableView.dequeueReusableCell(withIdentifier: "HeaderCell") as! CustomHeaderCell
        headerCell.backgroundColor = UIColorFromRGB(0xFF5A00)
        
        if but20.backgroundColor != UIColor.clear{
            headerCell.headerLabel.text = timings[section];
        }
        else if but21.backgroundColor != UIColor.clear{
            headerCell.headerLabel.text = timings1[section];
            
        }
        else{
            headerCell.headerLabel.text = timings2[section];
            
        }
        
        /*switch (section) {
         case 0:
         headerCell.headerLabel.text = timings[section];
         //return sectionHeaderView
         case 1:
         headerCell.headerLabel.text = timings[section];
         //return sectionHeaderView
         case 2:
         headerCell.headerLabel.text = timings[section];
         //return sectionHeaderView
         default:
         headerCell.headerLabel.text = "";
         }*/
        
        return headerCell
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 35.0    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 40))
        
        
        footerView.backgroundColor = UIColorFromRGB(0x4D3291)
        
        let version = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 40))
        version.font = version.font.withSize(15)
        version.textColor = UIColor.white
        version.center = CGPoint(x: footerView.bounds.size.width - 50, y: 20)
        version.translatesAutoresizingMaskIntoConstraints = true
        footerView.addSubview(version)
        let version1 = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 40))
        version1.font = version.font.withSize(15)
        version1.textColor = UIColor.white
        version1.center = CGPoint(x :110, y: 20)
        version1.translatesAutoresizingMaskIntoConstraints = true
        footerView.addSubview(version1)
        
        
        //        let footerView1 = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 40))
        //
        //
        //        footerView1.backgroundColor = UIColorFromRGB(0x4D3291)
        //
        //        let version2 = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 40))
        //        version2.font = version2.font.withSize(15)
        //        version2.textColor = UIColor.white
        //        version2.center = CGPoint(x: footerView1.bounds.size.width - 50, y: 20)
        //        version2.translatesAutoresizingMaskIntoConstraints = true
        //        footerView1.addSubview(version2)
        //        let version3 = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 40))
        //        version3.font = version.font.withSize(15)
        //        version3.textColor = UIColor.white
        //        version3.center = CGPoint(x :110, y: 20)
        //        version3.translatesAutoresizingMaskIntoConstraints = true
        //        footerView1.addSubview(version3)
        
        if but20.backgroundColor != UIColor.clear{
            print("20if")
            if timings[section] == "10:00 AM - 10:30 AM"
            {
                version.text = "10:30 AM - 10:45 AM";
                version1.text = "COFFEE BREAK"
                
            }
            else if timings[section] == "12:15 PM - 12:45 PM"{
                print("two")
                version.text = "12:45 PM - 13:45 PM";
                version1.text = "LUNCH BREAK";
                
                
            }
            else if timings[section] == "14:45 PM - 15:05 PM" {
                print("three")
                version.text = "15:35 PM - 15:50 PM";
                version1.text = "COFFEE BREAK"
                
                
            }
            else {
                print("zero")
                
            }
            
        }
        else if but21.backgroundColor != UIColor.clear{
            print("21if")
            
            if timings1[section] == "9:30 AM - 10:00 AM"
            {
                version.text = "10:00 AM - 10:30 AM";
                version1.text = "COFFEE BREAK"
                
            }
            else if timings1[section] == "10:30 AM - 13:00 PM"{
                print("two2")
                version.text = "13:00 PM - 14:00 PM";
                version1.text = "LUNCH BREAK";
                
                
            }
            else if timings1[section] == "14:00 PM - 16:30 PM" {
                print("three3")
                version.text = "16:30 PM - 16:45 PM";
                version1.text = "COFFEE BREAK"
            }
            else{
                
            }
        }
        else  if but22.backgroundColor != UIColor.clear{
            if  timings2[section] == "9:30 AM - 10:00 AM"
            {
                version.text = "10:00 AM - 10:20 AM";
                version1.text = "COFFEE BREAK"
                
            }
            else if timings2[section] == "10:20 AM - 13:00 PM"
            {
                print("two")
                version.text = "13:00 PM - 14:00 PM";
                version1.text = "LUNCH BREAK";
            }
            else if timings2[section] == "14:00 PM - 16:30 PM"
            {
                print("three")
                version.text = "16:30 PM - 17:00 PM";
                version1.text = "COFFEE BREAK"
            }
            else {
                print("zero")
                
            }
        }
        
        return footerView
        
    }
    
}











