//
//  PostViewController.swift
//  STUDI
//
//  Created by Mohamed Niyaz on 4/11/19.
//  Copyright © 2019 Mohamed Niyaz. All rights reserved.
//

import UIKit
import Firebase


class PostViewController: UIViewController {

    @IBOutlet weak var postButton: UIButton!
    @IBOutlet weak var textView: UITextView!
    override func viewDidLoad() {
    
        func setGradientBackground() {
            let colorTop =  UIColor(red: 255.0/255.0, green: 149.0/255.0, blue: 0.0/255.0, alpha: 1.0).cgColor
            let colorBottom = UIColor(red: 255.0/255.0, green: 94.0/255.0, blue: 58.0/255.0, alpha: 1.0).cgColor

            let gradientLayer = CAGradientLayer()
            gradientLayer.colors = [colorTop, colorBottom]
            gradientLayer.locations = [0.0, 1.0]
            gradientLayer.frame = self.view.bounds

            self.view.layer.insertSublayer(gradientLayer, at:0)
        }
        
        super.viewDidLoad()
       setGradientBackground()
        
    }
    

    @IBAction func post(_ sender: UIButton) {
        
        
        let postRef = Database.database().reference().child("post").childByAutoId()
        
        let postObject = [
            "text" : textView.text as Any,
        
        
        ] as [String:Any]
        
        postRef.setValue (postObject, withCompletionBlock: { error, ref in
            if error == nil   {
                self.performSegue(withIdentifier: "posted" , sender: nil)
        } else {
            //handle the error
            }
    })
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
}
