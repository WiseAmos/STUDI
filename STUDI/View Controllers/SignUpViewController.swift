//
//  ViewController.swift
//  STUDI
//
//  Created by Mohamed Niyaz on 31/10/19.
//  Copyright © 2019 Mohamed Niyaz. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn

 
   class SignUpViewController: UIViewController {
  


    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var signUpButton: UIButton!
    
    func setGradientBackground() {
        let colorTop =  UIColor(red: 255.0/255.0, green: 149.0/255.0, blue: 0.0/255.0, alpha: 1.0).cgColor
        let colorBottom = UIColor(red: 255.0/255.0, green: 94.0/255.0, blue: 58.0/255.0, alpha: 1.0).cgColor

        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = self.view.bounds

        self.view.layer.insertSublayer(gradientLayer, at:0)
    }
 
    @IBOutlet weak var usernameTextField: UITextField!
    override func viewDidLoad() {
   
        
        let bottomLine = CALayer()
          
        bottomLine.frame = CGRect(x: 0, y: passwordTextField.frame.height - 2, width: passwordTextField.frame.width, height: 2)
           bottomLine.backgroundColor = UIColor.init(red: 48/255, green: 173/255, blue: 99/255, alpha: 1).cgColor
           passwordTextField.borderStyle = .none
           passwordTextField.layer.addSublayer(bottomLine)
        
        let bottomLine2 = CALayer()
        
        bottomLine2.frame = CGRect(x: 0, y: emailTextField.frame.height - 2, width: emailTextField.frame.width, height: 2)
                  bottomLine2.backgroundColor = UIColor.init(red: 48/255, green: 173/255, blue: 99/255, alpha: 1).cgColor
                  emailTextField.borderStyle = .none
                 
        
        let bottomLine3 = CALayer()
          
        bottomLine3.frame = CGRect(x: 0, y: usernameTextField.frame.height - 2, width: usernameTextField.frame.width, height: 2)
           bottomLine3.backgroundColor = UIColor.init(red: 48/255, green: 173/255, blue: 99/255, alpha: 1).cgColor
         usernameTextField.borderStyle = .none
        usernameTextField.layer.addSublayer(bottomLine3)
        
        emailTextField.layer.addSublayer(bottomLine2)
        
        setGradientBackground()
       
        
        
        signUpButton.layer.cornerRadius = 20.0
        signUpButton.layer.borderWidth = 1.5
        signUpButton.layer.borderColor = UIColor.black.cgColor
        
   
    
        
        super.viewDidLoad()
    }
  
 
    
    
    
    @IBAction func onSignUp(_ sender: Any) {
        
 
        Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!) { authResult, error in
            if (error != nil) {
                print(error);
            } else {
                if  self.usernameTextField.text == "" {
                    var alert = UIAlertController(title: "Alert", message:
                        "Please fill in your username, thanks", preferredStyle: UIAlertController.Style.alert)

                    self.present(alert, animated: false, completion: nil)

                    alert.addAction(UIAlertAction(title: "Okie", style: UIAlertAction.Style.default,
                          handler: nil))
                       // CODE
                }
                
                else{
                    if self.emailTextField.text == "" {
                            var alert = UIAlertController(title: "Alert", message:
                                "Please fill in your email, thanks", preferredStyle: UIAlertController.Style.alert)

                            self.present(alert, animated: false, completion: nil)

                            alert.addAction(UIAlertAction(title: "Okie", style: UIAlertAction.Style.default,
                                  handler: nil))
                               // CODE
                        }
                    else {
                        
                                    print("working")
                        UserDefaults.standard.set(self.usernameTextField.text, forKey: "name")
                                            self.performSegue(withIdentifier: "signUpDone", sender: nil)
                    }

                    
               
            
                        
                }
                    
            }
        
        
        }
            
        
        
        
        
        
        
        
        
        
    }
}



