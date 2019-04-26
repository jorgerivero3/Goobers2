//
//  PartiesViewController.swift
//  Goobers
//
//  Created by Nolan Daniels on 4/22/19.
//  Copyright © 2019 Nolan Daniels. All rights reserved.
//

import UIKit
import CoreData

class PartiesViewController: UITableViewController {
    @IBOutlet var partyList: UITableView!
    
    var parties: [NSManagedObject] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
<<<<<<< HEAD
        //reutrn the length
        return 2
=======
        return parties.count
>>>>>>> 70a11376dedfd7a6ea2d8f8157da430ad42bec0f
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "party" /*PartyTableViewCell.cellReuseIdentifier*/, for:indexPath) as! PartyTableViewCell
         let party = parties[indexPath.row]
        
        //Default values
        //TODO: Implement CoreData to fill out this table
        cell.title.text = party.value(forKeyPath: "name") as? String
        cell.date.text = party.value(forKeyPath: "date") as? String
        cell.location.text = party.value(forKeyPath: "place") as? String
        cell.guests.text = "25 guests"
        
        return cell
    }

    @IBAction func cancelToView(_ segue: UIStoryboardSegue) {
        self.partyList.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Party")
        var fetchedResults:[NSManagedObject]? = nil
        
        do {
            //
            try fetchedResults = managedContext.fetch(fetchRequest) as [NSManagedObject]
        } catch  {
            let error = error as NSError
            print("Error loading, \(error), \(error.userInfo)")
        }
        if let results = fetchedResults{
            parties = results
        }
        
        self.partyList.reloadData()
    }


}
