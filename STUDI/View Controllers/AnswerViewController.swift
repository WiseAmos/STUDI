//
//  AnswerViewController.swift
//  STUDI
//
//  Created by Amos Goh En Jie on 5/11/19.
//  Copyright © 2019 Mohamed Niyaz. All rights reserved.
//

import UIKit

class AnswerViewController: UITableViewController {
    @IBOutlet weak var answerlabel: UILabel!
    
    var post: Post!
//    override var performsActionsWhilePresentingModally: Bool = post.answers
    override func viewDidLoad() {
        super.viewDidLoad()
        
        answerlabel.text = post.text
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return post.answers.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "answercell", for: indexPath) as! AnswersTableViewCell
//        cell.answer.text =
      
        
        
        
   
        return cell
    }

    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "passdata", let destination = segue.destination as? answerspostViewController {
            destination.post = post
            
            
        }
     
     
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    

}
