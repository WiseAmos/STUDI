//
//  ForumTableViewCell.swift
//  STUDI
//
//  Created by Amos Goh En Jie on 5/11/19.
//  Copyright © 2019 Mohamed Niyaz. All rights reserved.
//

import UIKit

class ForumTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var label: UILabel!
    let name = UserDefaults.standard.string(forKey: "name")

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        nameLabel.font = UIFont.italicSystemFont(ofSize: nameLabel.font.pointSize)
        nameLabel.text = name!
    }



    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

}
