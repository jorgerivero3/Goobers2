//
//  PartiesViewController.swift
//  Goobers
//
//  Created by Nolan Daniels on 4/22/19.
//  Copyright © 2019 Nolan Daniels. All rights reserved.
//

import UIKit

class PartiesViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //reutrn the length
        return 2
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print ("asdf")
        let cell = tableView.dequeueReusableCell(withIdentifier: "party" /*PartyTableViewCell.cellReuseIdentifier*/, for:indexPath) as! PartyTableViewCell
        
        //Default values
        //TODO: Implement CoreData to fill out this table
        cell.title.text = "Birthday"
        cell.date.text = "April 20, 2019"
        cell.location.text = "4404 Firewillow Way NW"
        cell.guests.text = "25 guests"
        
        return cell
    }


}
