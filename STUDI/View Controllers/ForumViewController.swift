//
//  ForumViewController.swift
//  STUDI
//
//  Created by Mohamed Niyaz on 2/11/19.
//  Copyright © 2019 Mohamed Niyaz. All rights reserved.
//

import UIKit
import FirebaseDatabase

class ForumViewController: UITableViewController {

    var ref: DatabaseReference!
    var namee: [String]! = []
  
    let name = UserDefaults.standard.string(forKey: "name")
    var posts : [Post] = []

    @IBOutlet weak var names: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        ref = Database.database().reference()
        
        ref.child("post").observe(.value, with: { (snapshot) in
            // Get user valueb
            self.posts.removeAll()
            
            let dic = snapshot.value as? NSDictionary ?? [:]
            
            for item in dic {
                let dict = item.value as! NSDictionary
                
                let id = item.key as? String ?? ""
                let username = dict["username"] as? String ?? ""
                let text = dict["text"] as? String ?? ""
                
                var post = Post(uuid: id, username: username, text: text, answers: [])
                
                if let answers = dict["answers"] as? NSDictionary {
                    for dict in answers.allValues {
                        if let answer = dict as? NSDictionary {
                            let username = answer["username"] as? String ?? ""
                            let text = answer["text"] as? String ?? ""
                            post.answers.append(Answer(username: username, text: text))
                        }
                    }
                }
                
                
                
                
//                print("\(username) : \(text)")
                self.posts.append(post)
                
            }
            
            self.tableView.reloadData()
        }) { (error) in
            print(error.localizedDescription)
        }
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        return posts.count
    }


    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "extraDetail", sender: nil)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "forumCell", for: indexPath) as! ForumTableViewCell
     
        // Configure the cell...

        let post = posts[indexPath.row]
        
        cell.label.text = post.text
        cell.nameLabel.text = post.username

        return cell
    }

    @IBAction func unwindToHome(_ unwindSegue: UIStoryboardSegue) {
       
        // Use data from the view controller which initiated the unwind segue
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let dest = segue.destination as! AnswerViewController
        if segue.identifier == "extraDetail", let indexPath = tableView.indexPathForSelectedRow {
            dest.post = posts[indexPath.row] 
        }
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
    }

}
 
