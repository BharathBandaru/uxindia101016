
import UIKit

/**
 * Snippet from CodeTrench.com
 */
class SplashViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //  addBackgroundImage()
        addLogo()
        
        // Show the home screen after a bit. Calls the show() function.
        _ = Timer.scheduledTimer(
            timeInterval: 2.5, target: self, selector: #selector(UIAlertView.show), userInfo: nil, repeats: false
        )
    }
    
    /*
     * Gets rid of the status bar
     */
    
    
    /*
     * Shows the app's main home screen.
     * Gets called by the timer in viewDidLoad()
     */
    func show() {
        let defaults = UserDefaults.standard
        let name = defaults.bool(forKey: "firsttime")
        if name == false{
            let mainStoryBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let tbc = mainStoryBoard.instantiateViewController(withIdentifier: "mylogin") as! LoginViewController
            self.present(tbc, animated: true, completion: nil)
            
            
        }
        else{
            let mainStoryBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let tbc = mainStoryBoard.instantiateViewController(withIdentifier: "mytabs") as! TabbedController
            self.present(tbc, animated: true, completion: nil)
        }
    }
    
    /*
     * Adds background image to the splash screen
     */
    //    func addBackgroundImage() {
    //        let screenSize: CGRect = UIScreen.main.bounds
    //
    //        let bg = UIImage(named: "playstore-icon")
    //        let bgView = UIImageView(image: bg)
    //
    //        bgView.frame = CGRect( x: 0,y: 0, width :screenSize.width,height: screenSize.height)
    //        self.view.addSubview(bgView)
    //    }
    
    /*
     * Adds logo to splash screen
     */
    func addLogo() {
        
        let logo     = UIImage(named: "playstore-icon")
        let logoView = UIImageView(image: logo)
        
        let w = 100.0 as CGFloat
        let h = 100.0 as CGFloat
        logoView.frame = CGRect(x:(self.view.frame.size.width / 2) - (w/2), y:(self.view.frame.size.height / 2) - (h/2),width: w,height: h )
        let label = UILabel(frame: CGRect(x: (self.view.frame.size.width / 2), y: (self.view.frame.size.height / 2) + (h) - 20, width: 200, height: 21))
        label.frame.origin = CGPoint(x: self.view.frame.width / 2 - 85, y: (self.view.frame.size.height / 2) + (h) - 20 )

        // you will probably want to set the font (remember to use Dynamic Type!)
        label.font = UIFont(name: "Helvetica", size: 30.0)
        // and set the text color too - remember good contrast
        label.textColor = UIColor.gray
        
        // may not be necessary (e.g., if the width & height match the superview)
        // if you do need to center, CGPointMake has been deprecated, so use this
        //label.center = CGPoint(x: 160, y: 284)
        
        // this changed in Swift 3 (much better, no?)
        //label.textAlignment = .center
        
        label.text = "UXIndia2016"
        
        self.view.addSubview(label)
        self.view.addSubview(logoView)
    }
}
