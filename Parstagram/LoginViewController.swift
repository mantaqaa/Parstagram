//
//  LoginViewController.swift
//  Parstagram
//
//  Created by Mantaqaa Khan on 3/19/19.
//  Copyright © 2019 Mantaqaa Khan. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {

    @IBOutlet weak var usernameField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func onSignin(_ sender: Any) {
        let username = usernameField.text!
        let password = passwordField.text!
        
        PFUser.logInWithUsername(inBackground: username, password: password){
            
      (user, error) in
            if user != nil {
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
                
            } else {
                print ("Error: \(error?.localizedDescription)")
            }
        }
    }
    
    
    @IBAction func onSignup(_ sender: Any) {
        
        let user = PFUser()
        user.username = usernameField.text
        user.password = passwordField.text
        
        user.signUpInBackground { (success, error ) in
            
            if success {
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            }
            else {
                print ("Error: \(error?.localizedDescription)")
            }
        }
    }
}
