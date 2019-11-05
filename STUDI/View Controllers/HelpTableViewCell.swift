//
//  HelpTableViewCell.swift
//  AppAuth
//
//  Created by Mohamed Niyaz on 4/11/19.
//

import UIKit

class HelpTableViewCell: UITableViewCell {

    @IBOutlet weak var moreHelpButton: UIButton!

    @IBOutlet weak var helpLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
