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
    override func viewDidLoad() {
       super.viewDidLoad()
       Answer.text = helpAnswers[indexNumber]
       Question.text = helpQuestions[indexNumber]
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
