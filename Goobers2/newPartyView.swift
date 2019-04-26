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
    
    
    
    
    guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
    return
    }
    
    let managedContext = appDelegate.persistentContainer.viewContext
    
    let entity = NSEntityDescription.entity(forEntityName: "Adventurer", in: managedContext)!
    
    let newChar = NSManagedObject(entity: entity, insertInto: managedContext)
    
    newChar.setValue(newID, forKey: "id")
    newID += 1
    newChar.setValue(charName?.text!, forKeyPath: "name")
    newChar.setValue(charClass?.text!, forKeyPath: "profession")
    newChar.setValue(health, forKeyPath: "hp")
    newChar.setValue(attack, forKeyPath: "ap")
    newChar.setValue(level, forKeyPath: "level")
    newChar.setValue(selectedImage, forKeyPath: "portrait")
    
    do {
    try managedContext.save()
    adventurers.append(newChar)
    print("Saved character \(String(describing: charName?.text!))")
    } catch let error as NSError {
    print("Failed to save, \(error), \(error.userInfo)")
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
