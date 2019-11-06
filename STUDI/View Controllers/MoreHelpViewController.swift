//
//  MoreHelpViewController.swift
//  STUDI
//
//  Created by Mohamed Niyaz on 5/11/19.
//  Copyright © 2019 Mohamed Niyaz. All rights reserved.
//

import UIKit

class MoreHelpViewController: UIViewController {

   
    var helpAnswers: [String]!
    var helpQuestions: [String]!
    var indexNumber: Int!

    @IBOutlet weak var Question: UILabel!
    @IBOutlet weak var Answer: UITextView!
   func setGradientBackground() {
          let colorTop =  UIColor(red: 255.0/255.0, green: 149.0/255.0, blue: 0.0/255.0, alpha: 1.0).cgColor
          let colorBottom = UIColor(red: 255.0/255.0, green: 94.0/255.0, blue: 58.0/255.0, alpha: 1.0).cgColor

          let gradientLayer = CAGradientLayer()
          gradientLayer.colors = [colorTop, colorBottom]
          gradientLayer.locations = [0.0, 1.0]
          gradientLayer.frame = self.view.bounds

          self.view.layer.insertSublayer(gradientLayer, at:0)
      }
    override func viewDidLoad() {
       super.viewDidLoad()
       Answer.text = helpAnswers[indexNumber]
       Question.text = helpQuestions[indexNumber]
       setGradientBackground()
       setLineSpacing(textView: Answer, lineSpacing: 10)
       Answer.font = UIFont(name: Answer.font?.fontName ?? "", size: 23)
    }
    
    func setLineSpacing(textView: UITextView, lineSpacing: CGFloat) {
        let style = NSMutableParagraphStyle()
        style.lineSpacing = lineSpacing
        let attributes = [NSAttributedString.Key.paragraphStyle : style]
        textView.attributedText = NSAttributedString(string: textView.text, attributes: attributes)
    }
    
    
    
    
}
