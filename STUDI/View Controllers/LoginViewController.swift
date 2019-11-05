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
    
    @IBOutlet weak var passwordTextField: UITextField!
    func setGradientBackground() {
        
        performSegue(withIdentifier: "answers", sender: nil)
       
        
 

        
        
        
        
        
        
        
        let colorTop =  UIColor(red: 255.0/255.0, green: 149.0/255.0, blue: 0.0/255.0, alpha: 1.0).cgColor
        let colorBottom = UIColor(red: 255.0/255.0, green: 94.0/255.0, blue: 58.0/255.0, alpha: 1.0).cgColor

        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = self.view.bounds

        self.view.layer.insertSublayer(gradientLayer, at:0)
    }
    

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
        emailTextField.layer.addSublayer(bottomLine2)
        
        setGradientBackground()
        
        loginButton.layer.cornerRadius = 20.0
        
        loginButton.layer.borderWidth = 0.5
        loginButton.layer.borderColor = UIColor.black.cgColor
        
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginButtonPressed(_ sender: Any) {
        
        let email = emailTextField.text!
        let password = passwordTextField.text!
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult,  error in
            guard let strongSelf = self else { return }
            if (error != nil) {
                
                //Send Alert
            } else {
                strongSelf.performSegue(withIdentifier: "done", sender: nil)
                
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
