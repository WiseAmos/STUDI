//
//  HelpViewController.swift
//  STUDI
//
//  Created by Mohamed Niyaz on 2/11/19.
//  Copyright © 2019 Mohamed Niyaz. All rights reserved.
//

import UIKit

class HelpViewController: UITableViewController {
    
    let HelpTitles = ["How can I post a question?","How do I find my answered questions?","How can I change my username?","How long does it take for my question to be answered?","How can I answer a question?"]
    let HelpDescs = ["Go to the forum section, and click the space which is labelled post at the bottom of the screen. You can then type out your question. After you are done, proceed to tap the send button.","Click on the Edit Profile button at the bottom of the functions bar. Here you may change your profile picture and username. Tap the text box where your username is displayed and type your new username.","That depends. If your question is frequently searched or asked, more people will see your question and respond to it.","Answering questions is simple, go to the forum function, and tap the question you want to answer. Afterwards, tap the empty text box to post your answer, you can post on the same question multiple times."]
    
    override func viewDidLoad() {
        super.viewDidLoad()

    
    }

  
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "Load View") {
            // Pass data to next view
        }
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return HelpTitles.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "helpCell", for: indexPath)
        
        cell.textLabel?.text = "\(HelpTitles[indexPath.row])"
        cell.detailTextLabel?.text = "Click for more info"
        
        return cell
      }
    
    
    @IBAction func unwindToHelp(_ unwindSegue: UIStoryboardSegue) {
       
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
