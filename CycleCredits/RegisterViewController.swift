//
//  RegisterViewController.swift
//  CycleCredits
//
//  Created by Patrick Murphy on 08/05/2015.
//  Copyright (c) 2015 Patrick Murphy. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {
    
    
    @IBOutlet weak var userEmail: UITextField!

    @IBOutlet weak var userPassword: UITextField!
    
    @IBOutlet weak var repeatPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func registerUser(sender: UIButton) {
        
        let email = userEmail.text
        let password = userPassword.text
        let passwordConfirm = repeatPassword.text
        
        // check for empty fields
        if(email.isEmpty || password.isEmpty || passwordConfirm.isEmpty) {
            
            // display alert message
            displayAlertMessage("All fields are required")
            
            return
        }
        
        // check if passwords match
        if(password != passwordConfirm) {
            
            // display alert message
            displayAlertMessage("Passwords do not match");
            return
        }
        
        // Store data locally
        NSUserDefaults.standardUserDefaults().setObject(email, forKey: "Email")
        NSUserDefaults.standardUserDefaults().setObject(password, forKey: "Password")
        NSUserDefaults.standardUserDefaults().synchronize()
        
        // Display alert message with confirmation
        var myAlert = UIAlertController(title: "Alert", message: "Registration was Sucessfull", preferredStyle: UIAlertControllerStyle.Alert)
        
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default) { action in
            self.dismissViewControllerAnimated(true, completion: nil)
        }
        myAlert.addAction(okAction)
        self.presentViewController(myAlert, animated: true, completion: nil)
    }
    
    func displayAlertMessage(userMeasage:String) {
        
        var myAlert = UIAlertController(title: "Alert", message: userMeasage, preferredStyle: UIAlertControllerStyle.Alert)
        
        let okAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil)
        
        myAlert.addAction(okAction)
        
       self.presentViewController(myAlert, animated: true, completion: nil)
        
    }
    

    

}
