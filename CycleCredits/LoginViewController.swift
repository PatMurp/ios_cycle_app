//
//  LoginViewController.swift
//  CycleCredits
//
//  Created by Patrick Murphy on 08/05/2015.
//  Copyright (c) 2015 Patrick Murphy. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    
    @IBOutlet weak var email: UITextField!
    
    @IBOutlet weak var password: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func Login(sender: UIButton) {
        
        let userEmail = email.text
        let userPassword = password.text
        
        // get stored email and password
        let userEmailStored = NSUserDefaults.standardUserDefaults().stringForKey("Email")
        let userPasswordStored = NSUserDefaults.standardUserDefaults().stringForKey("Password")
        
        if(userEmailStored == userEmail) {
            if(userPasswordStored == userPassword) {
                
                // Login seccessfull
                NSUserDefaults.standardUserDefaults().setBool(true, forKey: "isUserLogedIn")
                NSUserDefaults.standardUserDefaults().synchronize()
                self.dismissViewControllerAnimated(true, completion: nil)
            } else {
                displayAlertMessage("Invalid email or password")
            }
        } else {
            displayAlertMessage("Invalid email or password")
        }
        
        
    }
    
    func displayAlertMessage(userMeasage:String) {
        
        var myAlert = UIAlertController(title: "Alert", message: userMeasage, preferredStyle: UIAlertControllerStyle.Alert)
        
        let okAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil)
        
        myAlert.addAction(okAction)
        
        self.presentViewController(myAlert, animated: true, completion: nil)
        
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
