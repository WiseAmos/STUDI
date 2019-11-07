//
//  answerspostViewController.swift
//  STUDI
//
//  Created by Amos Goh En Jie on 6/11/19.
//  Copyright © 2019 Mohamed Niyaz. All rights reserved.
//

import UIKit
import Firebase

class answerspostViewController: UIViewController {
    func setGradientBackground() {
                     
                     let colorTop =  UIColor(red: 210/255.0, green: 109/255.0, blue: 180/255.0, alpha: 1.0).cgColor
                     let colorBottom = UIColor(red: 55/255.0, green: 148/255.0, blue: 228/255.0, alpha: 1.0).cgColor

                     let gradientLayer = CAGradientLayer()
                     gradientLayer.colors = [colorTop, colorBottom]
                     gradientLayer.locations = [0.0, 1.0]
                     gradientLayer.frame = self.view.bounds

                     self.view.layer.insertSublayer(gradientLayer, at:0)
                 }
    
    @IBOutlet weak var answerLabel: UILabel!
    @IBAction func hideButton(_ sender: Any) {
        answerLabel.isHidden = true
    }
    @IBOutlet weak var Answers: UITextView!
    @IBOutlet weak var done: UIButton!
    
    var post: Post!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setGradientBackground()
        Answers.layer.cornerRadius = 45
        // Do any additional setup after loading the view.
    }
    
    @IBAction func doned(_ sender: Any) {
        
        let ref = Database.database().reference().child("post").child(post.uuid).child("answers").observeSingleEvent(of: .value, with: { snapshot in
            let answerArray = snapshot.value;
//           answerArray?[0].text = Answers.text;
//            answerArray?[0].username = "post.username"
        })
        
        
        
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }



}
