//
//  PostSegueViewController.swift
//  STUDI
//
//  Created by Mohamed Niyaz on 4/11/19.
//  Copyright © 2019 Mohamed Niyaz. All rights reserved.
//

import UIKit

class PostSegueViewController: UIViewController {
    override func viewDidAppear(_ animated: Bool) {
        
        performSegue(withIdentifier: "showPost", sender: self)
        
        tabBarController?.selectedIndex = 0
    }
}


