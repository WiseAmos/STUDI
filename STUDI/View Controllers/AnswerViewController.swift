//
//  AnswerViewController.swift
//  STUDI
//
//  Created by Amos Goh En Jie on 5/11/19.
//  Copyright © 2019 Mohamed Niyaz. All rights reserved.
//

import UIKit
import FirebaseDatabase

class AnswerViewController: UITableViewController {
    @IBOutlet weak var answerlabel: UILabel!
    
    
    var ref: DatabaseReference!
    
    var post: Post!
//    override var performsActionsWhilePresentingModally: Bool = post.answers
    override func viewDidLoad() {
        super.viewDidLoad()
        
        answerlabel.text = post.text
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        ref = Database.database().reference()
                
        ref.child("post").child(post.uuid).child("answers").observe(.value, with: { (snapshot) in
            
            if let dict = snapshot.value as? NSDictionary {
                self.post.answers.removeAll()
                
                for item in dict.allValues {
                    if let answer = item as? NSDictionary {
                        let username = answer["username"] as? String ?? ""
                        let text = answer["text"] as? String ?? ""
                        self.post.answers.append(Answer(username: username, text: text))
                    }
                }
            }
            
            self.tableView.reloadData()
        }) { (error) in
            print(error.localizedDescription)
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return post.answers.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "answercell", for: indexPath) as! AnswersTableViewCell
        cell.answer.text = post.answers[indexPath.row].text
        cell.username.text = post.answers[indexPath.row].username
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "passdata", let destination = segue.destination as? answerspostViewController {
            destination.post = post
            
            
        }
     
     
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    

}
