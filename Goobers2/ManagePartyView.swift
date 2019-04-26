//
//  ManagePartyView.swift
//  Goobers2
//
//  Created by Nolan Daniels on 4/26/19.
//  Copyright © 2019 Nolan Daniels. All rights reserved.
//

import UIKit
import Contacts

class ManagePartyView: UIViewController {

    var contactStore = CNContactStore()
    var contacts = [ContactStruct]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        contactStore.requestAccess(for: .contacts) { (success, error) in
            if success {
                print("Authorization Successful")
            }
        }
        // Do any additional setup after loading the view.
    }
    



}
