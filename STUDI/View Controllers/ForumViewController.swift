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
    var questions: [String]! = []
    var namee: [String]! = []
     var post : [Any]?
    
    
    
    
    @IBOutlet weak var names: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
               let name = UserDefaults.standard.string(forKey: "name")
    var posted : [Any]?

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        var arr2: [Any] = []
        ref = Database.database().reference()
        
        ref.child( "post").observeSingleEvent(of: .value, with: { (snapshot) in
          // Get user valueb
            var tempPosted = [posts]()
                       if let valueDictionary = snapshot.value as? [AnyHashable:String]
                                 {
                                     let username = valueDictionary["username"]
                                     let text = valueDictionary["text"]
                                   
                                    let post = posts(username: "username", text: "text")
                                     tempPosted.append(post)
                                    post.text
                                    
                                 }
        
                       self.posted = tempPosted

        
        
            let value = snapshot.value as? NSDictionary
            let arr = value!.allValues
            for dic in arr {
                let dict = dic as! NSDictionary
                arr2.append((dict.allValues[0] as! String))
            }
            print("Fetched")
            print(arr2)
            self.questions! = arr2 as! [String]
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
        
        return questions.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "forumCell", for: indexPath) as! ForumTableViewCell

        
        cell.label.text = text
    
        // Configure the cell...

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "extraDetail", sender: nil)
        tableView.deselectRow(at: indexPath, animated: true)
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
            dest.Question = questions[indexPath.row]
        }
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
    }

}
