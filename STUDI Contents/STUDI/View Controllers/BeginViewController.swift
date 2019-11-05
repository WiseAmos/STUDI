//
//  BeginViewController.swift
//  STUDI
//
//  Created by Mohamed Niyaz on 3/11/19.
//  Copyright © 2019 Mohamed Niyaz. All rights reserved.
//

import UIKit

extension UIView {
    @discardableResult
    func applyGradient(colours: [UIColor]) -> CAGradientLayer {
        return self.applyGradient(colours: colours, locations: nil)
    }

    @discardableResult
    func applyGradient(colours: [UIColor], locations: [NSNumber]?) -> CAGradientLayer {
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = colours.map { $0.cgColor }
        gradient.locations = locations
        self.layer.insertSublayer(gradient, at: 0)
        return gradient
    }
}

        

class BeginViewController: UIViewController {
  
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    override func viewDidLoad() {
      super.viewDidLoad()
        Utilities.styleFilledButton(signUpButton)
        loginButton.layer.borderWidth = 0.5
        loginButton.layer.borderColor = UIColor.black.cgColor
        loginButton.layer.cornerRadius = 10.0
        signUpButton.layer.borderWidth = 0.5
        signUpButton.layer.borderColor = UIColor.black.cgColor
        signUpButton.layer.cornerRadius = 10.0
        let DarkOrange = UIColor(red: 255/255, green: 149/255, blue: 0/255, alpha: 1)
        let LightOrange = UIColor(red: 255/255, green: 203/255, blue: 43/255, alpha: 0.75)
        self.view.applyGradient(colours: [DarkOrange, LightOrange ], locations: [0,0.75])
        
        
        
       
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

