//
//  LoginViewController.swift
//  LoginProject
//
//  Created by Alex Gaesser on 1/29/15.
//  Copyright (c) 2015 AlexGaesser. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, CreateAccountViewControllerDelegate {
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "loginToCreateAccountSegue" {
            var createAccountVC = segue.destinationViewController as CreateAccountViewController
            createAccountVC.delegate = self
        }
    }

    @IBAction func loginButtonPressed(sender: UIButton) {
        let usernameSavedFromNSUserDefaults = NSUserDefaults.standardUserDefaults().objectForKey(kUserNameKey) as String
        println(usernameSavedFromNSUserDefaults)
        let passwordSaveFromNSUserDefaults = NSUserDefaults.standardUserDefaults().objectForKey(kPasswordKey) as String
        println(passwordSaveFromNSUserDefaults)
        
        if userNameTextField.text == usernameSavedFromNSUserDefaults && passwordTextField.text == passwordSaveFromNSUserDefaults {
                    self.performSegueWithIdentifier("loginToMainSegue", sender: self)
        }
    }
    
    @IBAction func createAccountButtonPressed(sender: UIButton) {
        self.performSegueWithIdentifier("loginToCreateAccountSegue", sender: self)
    }
    
    // CreateAccountViewControllerDelegate
    
    func accountCreated() {
        self.performSegueWithIdentifier("loginToMainSegue", sender: nil)
    }
    
}
