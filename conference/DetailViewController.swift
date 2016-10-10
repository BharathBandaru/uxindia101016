    //
    //  DetailViewController.swift
    //  conference
    //
    //  Created by Laxmi Rekha on 11/09/16.
    //  Copyright © 2016 ux. All rights reserved.
    //
    
    import UIKit
    
    class DetailViewController: UIViewController {
        
        var store = ""
        var store2 = ""
        var store3 = ""

        let imageName = [ "BAPU KALADHAR" :
            "kb.jpg", "K. T. RAMA RAO" : "ktr_uxindia","JAY PETERS" : "Jay_Peter_uxidia","SATISH RAMACHANDRAN" : "satish_uxindia", "ANDREW MAYFIELD" :
            "Andrew_Mayfield_uxindia","MARCELO PAIVA" :
            "Marcelo_Paiva_uxindia","PRASADD BARTAKKE" :"prasad_uxindia", "JEREMY YUILLE" :"Jeremy_Yuille_uxindia","KEVIN BOEZENNEC" : "kevin_uxindia","NAVEEN MAGMAIN" : "Naveen_Magmain_uxindia","ABINAYA LANIAPPAN" : "Abinaya_Palaniappan_uxindia","MADHURI" :"madhuri_uxindia","ADITI AGARWAL" : "Aditi_Agarwal_uxindia","SRINIVASU CHAKRAVARTULA" : "Srinivasu_Chakravartula_uxindia","CHANDNI RAJENDRAN" : "Chandni_Rajendran_uxindia","NEHA MODGIL" : "Neha_Modgil_uxindia","PRADEEP JOSEPH" : "Pradeep_Joseph_uxindia","MARIO" : "mario_uxindia","RANJEET" :"ranjeet_uxindia","NIHARIKA MACHANDA" : "Niharika_Manchanda_uxindia","KRANTI M" : "Kranti_M_uxindia","BALAKRISHNA CHOMLA" :"Balakrishna_Chamola_uxindia","PRASHANTH SHANMUGAM" : "Prashanth_Shanmugam_uxindia","PRACHI SAKHARDANDE" : "Prachi_Sakhardande_uxindia","KSHITIZ ANAND" : "Kshitiz_Anand_uxindia","PRASHANT DIXIT" : "Prashant_Dixit_uxindia","RAHUL ROUT" : "Rahul_Rout_uxindia","CHITRALI DHOLE" : "Chaitrali_Dhole_uxindia","DHEERAJ BATRA" : "avatar","PABLO SANCHEZ" : "Pablo_Sanchez_Martin_uxindia","STEVE FADDEN" : "Steve_Faden_uxindia"]
        let nameLabelNames = ["BAPU KALADHAR" :"Chair & Strategy UXINDIA2016,\n" +
            "Newyork","K. T. RAMA RAO" : "Honorable IT Minister,\n" +
            "Telangana State","JAY PETERS" : "Managing Director,\n" +
            "PARK USA & Grow USA","SATISH RAMACHANDRAN" : "Global Head of Design, Nutanix,\n" +
            "San Jose, USA","ANDREW MAYFIELD" : "CEO, Optimal Workshop,\n" +
            "New Zealand","MARCELO PAIVA" : "Product Design Director and Educator,\n" +
            "Miami, Florida, USA","PRASADD BARTAKKE" :"Chief of UX Design and Research, \n" +
            "YUJ Designs, India","JEREMY YUILLE" :"Principal, Meld Studios,\n" +
            "Australia","Steve Fadden" : "Director, Salesforce, California","Jayesh Ranjan" :"IT Secretary, Telangana State","Jan Baan" : "Dutch I.T. entrepreneur","Pablo Sanchez Martin" : "Director of User Experience,TiVo, USA","Robert Newham" : "Head of User Experience Design,Fidelity International, London, UK"]
        var speakerDB :[String:String] = ["K. T. RAMA RAO" : "Kalvakuntla Taraka Rama Rao popularly known as KTR, is an Indian politician from the Telangana state . He currently serves as the Cabinet Minister for the State for three different portfolios namely Information Technology (IT), Panchayat Raj and​ ​ Municipal Administration and Urban Development. KTR has been awarded Most Inspirational Icon on the Year 2015 by CNN-IBN​ ​ and Ritz Magazine. KTR\'s vision is to see Telangana\'s capital city in the coming years as the start-up capital of India.",
                                          "JAYESH" :
            "Mr. Jayesh Ranjan is the Secretary, Information Technology, Electronics & Communications Department, Government of Telangana. Guided by the overall vision of IT E&C Minister Sri KT Rama Rao and assisted by senior and middle level officers, the Secretary plays crucial role in IT Policy formulation, e-governance initiatives, promoting investments in IT, ITES and allied sectors, creating congenial environment for companies to setup and expand their operations, providing strong communication backbone in the State, skilling the youth for availing opportunities the sector offers, among others. Prior to the present assignment, he was Commissioner of Industries and Managing Director for Telangana State Industrial Infrastructure Corporation (TSIIC).",
                                          "JAY PETERS" :
            "Jay Peters is the Managing Director of PARK USA, a world leading design & innovation management consulting firm, and Managing Director of Grow USA, a world leading professional education provider in Design Management & Design Leadership. Collectively PARK & Grow endeavor to deliver on their shared mission to Empower Design Leaders. Jay consults, coaches and educates clients from major leading global brands such as LEGO, Nestle, Sony, Kimberly-Clark, Novo Nordisk, BASF, Unilever, Honda, Roche and many others; as well as (non)governmental organizations and academic institutions on using design and innovation lead practices to maximize value across the triple (profit, planet & people) bottom line. Jay has lived and worked extensively across Europe and the USA, and holds a bachelor degree in Product Design and marketing Minor from Southern Illinois University and a Master’s Degree in Business Design from Domus Academy in Milan, Italy.",
                                          "JEREMY YUILLE" :
            "Jeremy has over 20 years of experience in design, particularly around human interactions and user experience, fostering collaborative working across multidiscplinary teams, with a focus on achieving impact for a diverse range of clients. He has an uncanny ability to synthesize, translating between and drawing on, many different disciplines. Jeremy is a strategic thinker who shares his ideas visually.",
                                          "ANDREW MAYFIELD" :
            "Andrew is CEO and Product Manager of Optimal Workshop. Their tools are used and loved by information architects, designers and user experience consultants around the world. Andrew’s background is in software design and development. These days he sets the strategic direction at Optimal Workshop and is active in the information architecture and user experience communities in New Zealand and abroad.",
                                          "MARCELO PAIVA" :
            "\"Impacting Organizations through proper Design practices education.\" (Keynote) The Digital Product Design field has been going through an identity crisis for almost 20 years. It's about time we try to make sense of it. During this 30 minute talk, you will learn what it takes to impact your organization through proper product design practices education to your team members and executives.",
                                          "STEVE FADDEN" :
            "Steve Fadden works as a user researcher with Analytics User Experience at Salesforce. He also serves as a lecturer at the School of Information (I School), University of California, Berkeley. He received his Ph.D. in Engineering Psychology (Human Factors) from the University of Illinois in 1999, where he studied cognitive and perceptual factors associated with navigation (especially head-up display design), air traffic control, reading, and task switching. His has worked in industry, consulting, and academic environments, serving in individual contributor and management positions. Steve has had the opportunity to experience working in a number of development environments, from waterfall to agile, in domains as diverse as consumer transactions, financial operations, intelligence and security analysis, and aviation and transportation. Steve is passionate about education and mentoring, and has worked with a number of clients and organizations to research and develop solutions to address the needs of diverse learners (such as students with disabilities and those from underserved environments).",
                                          "PABLO" :
            "Director of User Experience Design with 20 years of creative leadership gained in Europe, USA and Asia. Proud to have built UX teams for companies such as Yahoo!, TiVO, Hewlett-Packard, Western Digital or Chase. Humble to have been honored by The Webby Awards and the N/N Design Annual.",
                                          "SHAUN" :
            "Shaun Wortis leads the product UX design team at Pegasystems, as Senior Director of UX & Product Design. The Pega 7 application-building software platform is the world's most advanced and Pega's clients are the largest organizations in the world. Pega software solves incredibly complex problems, touching the lives of millions world-wide every day. Before joining Pegasystems in 2011, Wortis ran a design and development firm in Cambridge, USA. He was a founder of the Open Scholar web platform, built for Harvard University.",
                                          "BAPU KALADHAR" :
            "Bapu Kaladhar is a Strategic Design Thinker and Information Architect. He is most interested in incubating new business models that deliver social impact, that are environmental friendly and that drive economic growth while strengthening the ‘Good Design for Better Living’ value proposition. He has established a reputation for building innovative, easy and pleasurable to use products and applications for Goldman Sachs, Met Life, Fannie Mae, Fidelity, Microsoft, Sapient, Cordys, BaaN and numerous startups. He is one of the very firsts to bring User Experience Design to India. His relentless commitment to social impact has led him to contribute to several non- profit boards.He founded UXINDIA and UsabilityMatters.Org (UMO) – a not for profit organization to create design awareness and make a positive difference in how we educate our next generation through strategic, technological and sustainable innovations. He always believes that spreading awareness is the best form of education. Programs like Industry + Academia Fusion, UX Clinic, UX Talent Fair, Instill Design - Design Education for a Social Change, TechEase, iINNOVATE, Boycott Bad Designs and World Usability Day have been the most participated and appreciated initiatives. He graduated from the prestigious Pratt Institute, New York in Design Management and from the Industrial Design Center, Indian Institute of Technology Bombay(IITB) in Design .",
                                          "SATISH RAMACHANDRAN" :
            "Satish Ramachandran is the Global head of design at Nutanix where he is dedicated to applying design to reimagine enterprise computing. Satish ensures the products being built reflect the user’s intent, with minimal, simple and delightful interactions. Additionally, he strives to scale the design organization and processes to keep pace with rapid growth. Prior to Nutanix, Satish held a variety of management and technical leadership roles over the past two decades at computing infrastructure companies such as DataDomain (EMC), Andiamo (Cisco), and Tandem (HP). A deep background in engineering coupled with a long standing interest in literature, music, cognition, human behavior and philosophy enable him to bridge the twin worlds of design and engineering effectively. Satish holds an M.S. in computer science. He lives in Silicon valley with his family.",
                                          "PRASADD BARTAKKE" :
            "A Design Purist What has brought accolades to YUJ Designs is the way Prasadd drives user research, interaction design and visual design with equal zest and excellence. This is what our organization believes is at core of being a fine designer and campaigner of user centered design.As Chief of Experience Design (CXD), he is responsible for anchoring new engagements, building strategies and teams that help our customers – most of them fortune 500 - create winning solutions to business challenges. At work, his top operational priorities are design management, bringing structure, aligning strategies to goals, transforming talent through training, craft processes for culture of directed growth. Prasadd is always hungry for finding new insights, revealing hidden connections and bringing clarity to supposed complexity. He enjoys taking up wide range of projects at any time – enterprise application, comsumer sites and devices or innovation stints to create impactful designs. Prasadd has conducts workshop and training programs for design institutes and corporates. He has been a speaker at national and international conferences and his talk focus on Design management, UX strategy, reimagining UX.",
                                          "Steve Fadden" : "Steve Fadden works as a user researcher with Analytics User Experience at Salesforce. He also serves as a lecturer at the School of Information (I School), University of California, Berkeley. He received his Ph.D. in Engineering Psychology (Human Factors) from the University of Illinois in 1999, where he studied cognitive and perceptual factors associated with navigation (especially head-up display design), air traffic control, reading, and task switching.",
                                          "Jayesh Ranjan" : "Mr. Jayesh Ranjan is the Secretary, Information Technology, Electronics & Communications Department, Government of Telangana. Guided by the overall vision of IT E&C Minister Sri KT Rama Rao and assisted by senior and middle level officers, the Secretary plays crucial role in IT Policy formulation, e-governance initiatives, promoting investments in IT, ITES and allied sectors, creating congenial environment for companies to setup and expand their operations, providing strong communication backbone in the State, skilling the youth for availing opportunities the sector offers, among others. Prior to the present assignment, he was Commissioner of Industries and Managing Director for Telangana State Industrial Infrastructure Corporation (TSIIC).",
                                          "Jan Baan" :"Jan Baan ​ is a Dutch entrepreneur and venture capitalist, known as the founder of the Baan Company, a software company providing​ ​ Enterprise Resource Planning (ERP) software. After selling the company, he founded Cordys, a company to provide web-related ERP products.\n"+"In 1978, Jan founded The Baan Company, a software company providing ERP solutions, which became a major player in the ERP software industry. Jan Baan left the Baan Company in 1998. After his efforts with the Baan Company, Baan became a venture capitalist and invested in companies like Top Tier and WebEx; both were eventually valued above $1billion. Top Tier was later sold to SAP, while WebEx was sold to Cisco.",
                                          "Pablo Sanchez Martin" : "Director of User Experience Design with 20 years of creative leadership gained in Europe, USA and Asia. Proud to have built UX teams for companies such as Yahoo!, TiVO, Hewlett-Packard, Western Digital or Chase. Humble to have been honored by The Webby Awards and the N/N Design Annual.",
                                          "Robert Newham" : "Robert leads the UX design practice at Fidelity International. He has a background in digital strategy and design consulting for organisations such as British Library, BP, Care UK, EY, FCA, HSBC, Grosvenor, KPMG, NS&i, RBS, Sage, Shell, State Street Global Advisors and T Rowe Price. Most recently Robert worked alongside the UK Government Digital Service as Head of Digital at the Money Advice Service."]
        @IBOutlet weak var nameLabel: UILabel!
        @IBOutlet weak var matter: UITextView!
        @IBOutlet weak var speakerdes: UILabel!
        @IBOutlet weak var imagel: UIImageView!
        @IBOutlet weak var headingLabel: UILabel!
        override func viewDidLoad() {
            super.viewDidLoad()
            nameLabel.text = store
            store2 = "\"" + store2 + "\""
            headingLabel.text = store2;
            speakerdes.text = nameLabelNames[store]
            self.imagel.clipsToBounds = true
            self.imagel.layer.cornerRadius = 50
            self.imagel.image = UIImage(named: imageName[store]!)
            matter.text = store3
            print("mystore \(store)")
            
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
