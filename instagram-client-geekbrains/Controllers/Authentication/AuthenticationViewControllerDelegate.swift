//
//  AuthenticationViewControllerDelegate.swift
//  instagram-client-geekbrains
//
//  Created by Aleksandr Zhuravlev on 18/08/2018.
//  Copyright © 2018 Aleksandr Zhuravlev. All rights reserved.
//

import Foundation
import UIKit

protocol AuthenticationViewControllerDelegate: class {
    func authenticationViewController(_ viewController: UIViewController, authorizedWith token:String?)
}
