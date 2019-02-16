//
//  LoginViewController.swift
//  Instagram
//
//  Created by 이승헌 on 11/02/2019.
//  Copyright © 2019 individual. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {

    @IBOutlet weak var username_field: UITextField!
    @IBOutlet weak var password_field: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func sign_in(_ sender: Any) {
        let username = username_field.text!
        let password = password_field.text!
        
        PFUser.logInWithUsername(inBackground: username, password: password)
        { (user, error) in
            if user != nil {
                self.performSegue(withIdentifier: "login_segue", sender: nil)
            } else {
                print("Error Messagee: \(String(describing: error?.localizedDescription))")
            }
        }
        
    }
    
    @IBAction func sign_up(_ sender: Any) {
        let user = PFUser()
        user.username = username_field.text
        user.password = password_field.text
        user.signUpInBackground{ (success, error) in
            if success {
                self.performSegue(withIdentifier: "login_segue", sender: nil)
            } else {
                print("Error Messagee: \(String(describing: error?.localizedDescription))")
            }
            
        }
        

    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
