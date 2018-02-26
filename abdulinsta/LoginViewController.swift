//
//  LoginViewController.swift
//  abdulinsta
//
//  Created by Aziz Alenezi on 2/25/18.
//  Copyright © 2018 Aziz Alenezi. All rights reserved.
//

import UIKit
import Parse


class LoginViewController: UIViewController {
    
    @IBOutlet weak var usernameField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onSignIn(sender: AnyObject) {
        PFUser.logInWithUsername(inBackground: usernameField.text!, password: passwordField.text!) { (user: PFUser?, error: Error) in
            if user != nil {
                print("you're logged in!")
                self.performSegue(withIdentifier: "loginSeque", sender: nil)
                
            }
            } as! PFUserResultBlock as! PFUserResultBlock
    }
            
            
            
    
    @IBAction func onSignUp(sender: AnyObject) {
        let newUser = PFUser()
        newUser.username = usernameField.text
        newUser.password = passwordField.text
        newUser.signUpInBackground { (success: Bool, error: Error?) in
            if success {
                print("yay, created a user")
                self.performSegue(withIdentifier: "loginSeque", sender: nil)
            } else {
                print(error?.localizedDescription as Any)
            }
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
}
