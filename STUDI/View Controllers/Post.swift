//
//  sturct.swift
//  STUDI
//
//  Created by Amos Goh En Jie on 6/11/19.
//  Copyright © 2019 Mohamed Niyaz. All rights reserved.
//

import Foundation

struct Answer {
    var username : String
    var text : String
}

struct Post {
    var uuid: String
    var username : String
    var text : String
    
    var answers: [Answer]
}

