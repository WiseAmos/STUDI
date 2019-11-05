//
//  ViewController.swift
//  STUDI
//
//  Created by Mohamed Niyaz on 31/10/19.
//  Copyright © 2019 Mohamed Niyaz. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth


 
   class SignUpViewController: UIViewController {

    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var signUpButton: UIButton!
    
    
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
        
        let DarkOrange = UIColor(red: 255/255, green: 149/255, blue: 0/255, alpha: 1)
        let LightOrange = UIColor(red: 255/255, green: 193/255, blue: 73/255, alpha: 1)
       
        self.view.applyGradient(colours: [DarkOrange, LightOrange,  ], locations: [0,0.75])
        
        signUpButton.layer.cornerRadius = 10.0
        signUpButton.layer.borderWidth = 0.5
        signUpButton.layer.borderColor = UIColor.black.cgColor
    
        
        super.viewDidLoad()
        
    
    
    }


}


