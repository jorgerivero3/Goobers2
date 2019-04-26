//
//  newPartyView.swift
//  Goobers2
//
//  Created by Jack Schaeffer on 4/26/19.
//  Copyright © 2019 Nolan Daniels. All rights reserved.
//

import UIKit
import CoreData

class newPartyView: UIViewController {

    
    @IBOutlet weak var pName: UITextField!
    @IBOutlet weak var pDesc: UITextField!
    @IBOutlet weak var pDate: UIDatePicker!
    @IBOutlet weak var pPlace: UITextField!
    
    var parties: [NSManagedObject] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


    
    @IBAction func newParty(_ sender: UIButton) {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
        return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Party", in: managedContext)!
        let newParty = NSManagedObject(entity: entity, insertInto: managedContext)
        print("a")
        newParty.setValue(pName?.text, forKey: "name")
        newParty.setValue(pDesc?.text, forKey: "desc")
        newParty.setValue(pDate?.date, forKey: "date")
        newParty.setValue(pPlace?.text, forKey: "place")
        
//        let newParty = NSManagedObject(entity: entity, insertInto: managedContext)
//
//        newParty.setValue(pName?.text!, forKeyPath: "name")
//
        do {
        try managedContext.save()
        parties.append(newParty)
        print("Saved character \(String(describing: pName?.text!))")
            
            
        } catch let error as NSError {
        print("Failed to save, \(error), \(error.userInfo)")
        }
    
    }
}
