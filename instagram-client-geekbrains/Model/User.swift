//
//  User.swift
//  instagram-client-geekbrains
//
//  Created by Aleksandr Zhuravlev on 18/08/2018.
//  Copyright © 2018 Aleksandr Zhuravlev. All rights reserved.
//

import Foundation

class User {
    let identifier: Int
    let userName: String
    let avatarImageURLString: String
    let fullName: String
    
    init(identifier: Int, userName: String, avatarImageURLString: String, fullName: String) {
        self.identifier = identifier
        self.userName = userName
        self.avatarImageURLString = avatarImageURLString
        self.fullName = fullName
    }
    
    convenience init(dictionary: [String: Any]) {
        self.init(identifier: Int(dictionary["id"] as! String)!,
                  userName: dictionary["username"] as! String,
                  avatarImageURLString: dictionary["profile_picture"] as! String,
                  fullName: dictionary["full_name"] as! String)
    }
    
}
