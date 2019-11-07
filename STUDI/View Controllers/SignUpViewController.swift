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
       
       @IBOutlet weak var usernameTextField: UITextField!
    
    @IBOutlet weak var errorMessage: UILabel!
    
    @IBOutlet weak var confirmField: UITextField!
    
    @IBOutlet weak var button: UIButton!
    
    func setGradientBackground() {
           
           let colorTop =  UIColor(red: 210/255.0, green: 109/255.0, blue: 180/255.0, alpha: 1.0).cgColor
           let colorBottom = UIColor(red: 55/255.0, green: 148/255.0, blue: 228/255.0, alpha: 1.0).cgColor

           let gradientLayer = CAGradientLayer()
           gradientLayer.colors = [colorTop, colorBottom]
           gradientLayer.locations = [0.0, 1.0]
           gradientLayer.frame = self.view.bounds
        
           self.view.layer.insertSublayer(gradientLayer, at:0)
       }
    
    
    
       override func viewDidLoad() {
        button.layer.cornerRadius = 20
      signUpButton.layer.borderWidth = 4.5
     signUpButton.layer.borderColor = UIColor.white.cgColor
      signUpButton.layer.cornerRadius = 35
        button.layer.backgroundColor = .init(srgbRed: 0, green: 0, blue: 0, alpha: 0)
        button.titleLabel!.text = "Privacy Policy"
        button.layer.borderWidth = 2.5
        button.layer.borderColor = UIColor.white.cgColor
    
           
           let bottomLine = CALayer()
        errorMessage.alpha = 0
           bottomLine.frame = CGRect(x: 0, y: passwordTextField.frame.height - 2, width: passwordTextField.frame.width, height: 3)
           bottomLine.backgroundColor = UIColor.white.cgColor
               passwordTextField.borderStyle = .none
              passwordTextField.layer.addSublayer(bottomLine)
           
           let bottomLine2 = CALayer()
           
           bottomLine2.frame = CGRect(x: 0, y: emailTextField.frame.height - 2, width: emailTextField.frame.width, height: 3)
                    bottomLine2.backgroundColor = UIColor.white.cgColor
                     emailTextField.borderStyle = .none
                    emailTextField.layer.addSublayer(bottomLine2)
                          
           
           let bottomLine3 = CALayer()
             
           bottomLine3.frame = CGRect(x: 0, y: usernameTextField.frame.height - 2, width: usernameTextField.frame.width, height: 3)
              bottomLine3.backgroundColor = UIColor.white.cgColor
            usernameTextField.borderStyle = .none
           usernameTextField.layer.addSublayer(bottomLine3)
        
        
                  let bottomLine4 = CALayer()
                    
                  bottomLine4.frame = CGRect(x: 0, y: confirmField.frame.height - 2, width: confirmField.frame.width, height: 3)
                     bottomLine4.backgroundColor = UIColor.white.cgColor
                   confirmField.borderStyle = .none
                   confirmField.layer.addSublayer(bottomLine4)
           
           
           setGradientBackground()
          
       
           
      
       
           
           super.viewDidLoad()
       }
     
    
       
       
       
       @IBAction func onSignUp(_ sender: Any) {
           
    
           Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!) { authResult, error in
               if (error != nil) {
                
                if self.passwordTextField.text!.count <= 6 {
                    self.errorMessage.alpha = 1
                    self.errorMessage.text = "Seems that your password is too short. Your password should be longer than 6 letters"
                }
                
                else if self.usernameTextField.text == "" || self.emailTextField.text == "" || self.passwordTextField.text == "" {
                    self.errorMessage.alpha = 1
                    self.errorMessage.text = "Please fill in all fields"
                }
                
                else if self.confirmField.text != self.passwordTextField.text {
                    self.errorMessage.alpha = 1
                    self.errorMessage.text = "Passwords do not match"
                }
                
                else {
                self.errorMessage.alpha = 1
                self.errorMessage.text = "Please ensure all fields are filled in correctly"
    
                }
                
               }
               
               else {

                           UserDefaults.standard.set(self.usernameTextField.text, forKey: "name")
                                               self.performSegue(withIdentifier: "signUpDone", sender: nil)
                       }

                       
                  
               
                           
                   }
                       
               }
           
           
           }
               
           
           
           
           
           
           
           




