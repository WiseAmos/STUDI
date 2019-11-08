//
//  BeginViewController.swift
//  STUDI
//
//  Created by Mohamed Niyaz on 3/11/19.
//  Copyright © 2019 Mohamed Niyaz. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn



class BeginViewController: UIViewController {
    @IBOutlet weak var signUpButton: UIButton!
    
    @IBOutlet weak var loginButton: UIButton!
  
    func setGradientBackground() {
           
           let colorTop =  UIColor(red: 210/255.0, green: 109/255.0, blue: 180/255.0, alpha: 1.0).cgColor
           let colorBottom = UIColor(red: 55/255.0, green: 148/255.0, blue: 228/255.0, alpha: 1.0).cgColor
        
           let gradientLayer = CAGradientLayer()
           gradientLayer.colors = [colorTop, colorBottom]
           gradientLayer.locations = [0.0, 1.0]
           gradientLayer.frame = self.view.bounds

           self.view.layer.insertSublayer(gradientLayer, at:0)
       }
               
       var handle: AuthStateDidChangeListenerHandle?
       
       override func viewDidLoad() {
         super.viewDidLoad()
           
           loginButton.layer.borderWidth = 4.5
           loginButton.layer.borderColor = UIColor.white.cgColor
        loginButton.layer.cornerRadius = loginButton.frame.height / 2
             loginButton.tintColor = UIColor.white
           signUpButton.layer.borderWidth = 4.5
           signUpButton.layer.borderColor = UIColor.white.cgColor
        signUpButton.layer.cornerRadius = signUpButton.frame.height / 2
           loginButton.tintColor = UIColor.white
           signUpButton.tintColor = UIColor.white
           setGradientBackground()
       }
    
    override func viewDidAppear(_ animated: Bool) {
        self.handle = Auth.auth().addStateDidChangeListener { (auth, user) in
            // Code
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        Auth.auth().removeStateDidChangeListener(self.handle!)
    }

       @IBAction func cancelDatabasing(_ unwindSegue: UIStoryboardSegue) {
           // Use data from the view controller which initiated the unwind segue
       }
           // Do any additional setup after loading the view.
   }
       

       /*
       // MARK: - Navigation

       // In a storyboard-based application, you will often want to do a little preparation before navigation
       override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           // Get the new view controller using segue.destination.
           // Pass the selected object to the new view controller.
       }
       */

