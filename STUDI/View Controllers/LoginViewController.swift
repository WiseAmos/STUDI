//
//  LoginViewController.swift
//  STUDI
//
//  Created by Mohamed Niyaz on 3/11/19.
//  Copyright © 2019 Mohamed Niyaz. All rights reserved.
//

import UIKit
import GoogleSignIn
import FirebaseAuth

class LoginViewController: UIViewController {
    
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var errorMessage: UILabel!
    
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
            

            
            super.viewDidLoad()
             loginButton.layer.borderWidth = 4.5
             loginButton.layer.borderColor = UIColor.white.cgColor
            loginButton.layer.cornerRadius = loginButton.frame.height / 2
             loginButton.tintColor = UIColor.white
             errorMessage.alpha = 0
             errorMessage.text = "e"
             
             
             
             let bottomLine = CALayer()
             print(passwordTextField.frame.width)
             bottomLine.frame = CGRect(x: 0, y: passwordTextField.frame.height - 2, width: passwordTextField.frame.width - 50, height: 3)
             bottomLine.backgroundColor = UIColor.white.cgColor
             passwordTextField.borderStyle = .none
             passwordTextField.layer.addSublayer(bottomLine)
             
            let bottomLine2 = CALayer()
            
            bottomLine2.frame = CGRect(x: 0, y: emailTextField.frame.height - 2, width: emailTextField.frame.width - 50, height: 3)
                     bottomLine2.backgroundColor = UIColor.white.cgColor
                      emailTextField.borderStyle = .none
                     emailTextField.layer.addSublayer(bottomLine2)
             
             let bottomLine3 = CALayer()
                
              bottomLine3.frame = CGRect(x: 0, y: usernameTextField.frame.height - 2, width: usernameTextField.frame.width - 50, height: 3)
                 bottomLine3.backgroundColor = UIColor.white.cgColor
               usernameTextField.borderStyle = .none
              usernameTextField.layer.addSublayer(bottomLine3)
              
              
              
             
                    
             setGradientBackground()
              hideKeyboardWhenTappedAround()
            // Do any additional setup after loading the view.
        }
        
        @IBAction func loginButtonPressed(_ sender: Any) {
            
            UserDefaults.standard.set(usernameTextField.text, forKey: "name")
            let email = emailTextField.text!
            let password = passwordTextField.text!
            Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult,  error in
                guard let strongSelf = self else { return }
                if (error != nil) {
                    
                    self!.errorMessage.text = "Please ensure you have entered your information correctly"
                    
                } else {
                    if self!.usernameTextField.text == ""{
                        self!.errorMessage.alpha = 1
                        self!.errorMessage.text = "Please fill in all fields"
                    } else { strongSelf.performSegue(withIdentifier: "Logindone", sender: nil)
                    }
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

