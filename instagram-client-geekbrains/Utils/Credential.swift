//
//  Credential.swift
//  instagram-client-geekbrains
//
//  Created by Aleksandr Zhuravlev on 18/08/2018.
//  Copyright © 2018 Aleksandr Zhuravlev. All rights reserved.
//

import Foundation

class Credential {
    static let userDefaultsTokenKey = "userDefaultsTokenKey"
    
    
    static var isUserAuthenticated: Bool {
        return token != nil
    }
    
    static var token: String? {
        get {
            return UserDefaults.standard.value(forKey: userDefaultsTokenKey) as? String
        }
        set {
            UserDefaults.standard.set(newValue, forKey: userDefaultsTokenKey )
        }
    }
}
