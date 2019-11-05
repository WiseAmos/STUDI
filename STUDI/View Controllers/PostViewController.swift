//
//  PostViewController.swift
//  STUDI
//
//  Created by Amos Goh En Jie on 5/11/19.
//  Copyright © 2019 Mohamed Niyaz. All rights reserved.
//

import UIKit
import Firebase

class PostViewController: UIViewController, UITextViewDelegate {
    
    @IBOutlet weak var postButton: UIButton!
    @IBOutlet weak var textView: UITextView!
    
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    
    var content: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        postButton.layer.cornerRadius = postButton.frame.height / 4
        postButton.layer.shadowOpacity = 0.1
        postButton.layer.shadowOffset = CGSize(width: 0, height: 5)
        postButton.layer.shadowRadius = 4
        postButton.alpha = 0.9
        
        textView.delegate = self
        
        content = ""
        
        NotificationCenter.default.addObserver(self, selector: #selector(PostViewController.keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(PostViewController.keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillShow(notification: Notification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            bottomConstraint.constant = -keyboardSize.height
        }
    }

    @objc func keyboardWillHide(notification: Notification) {
        bottomConstraint.constant = -20
    }
    
    func setTextViewAsPlaceHolder() {
        textView.textColor = UIColor.systemGray
        textView.text = "What is the density of Aluminium?"
    }
    
    func setTextViewAsEditing() {
        textView.textColor = UIColor.darkText
        textView.text = ""
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if content == "" {
            setTextViewAsEditing()
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if content == "" {
            setTextViewAsPlaceHolder()
        }
    }
    
    func textViewDidChange(_ textView: UITextView) {
        content = textView.text
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
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
