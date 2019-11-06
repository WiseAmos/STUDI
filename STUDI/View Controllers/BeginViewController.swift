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
        
        let colorTop =  UIColor(red: 32/255.0, green: 119/255.0, blue: 206/255.0, alpha: 1.0).cgColor
        let colorBottom = UIColor(red: 23/255.0, green: 171/255.0, blue: 161/255.0, alpha: 1.0).cgColor

        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = self.view.bounds

        self.view.layer.insertSublayer(gradientLayer, at:0)
    }
            
    var handle: AuthStateDidChangeListenerHandle?
    
    override func viewDidLoad() {
      super.viewDidLoad()
        Utilities.styleFilledButton(signUpButton)
        loginButton.layer.borderWidth = 7
        loginButton.layer.borderColor = UIColor.white.cgColor
        loginButton.layer.cornerRadius = 45.0
        signUpButton.layer.borderWidth = 7
        signUpButton.layer.borderColor = UIColor.white.cgColor
        signUpButton.layer.cornerRadius = 45.0
        loginButton.tintColor = UIColor.white
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

