//
//  PartiesCollectionViewController.swift
//  Goobers
//
//  Created by Nolan Daniels on 4/22/19.
//  Copyright © 2019 Nolan Daniels. All rights reserved.
//

import UIKit

let drinks1 = ["Coffee", "Tea"]
let music1 = ["Lydia Kepinski","Klo Pelgag", "Laurence Nerbonne"]
let guests1 = ["Jorge Rivero","Nolan Daniels", "Jack Schaeffer"]

let p1 = Party(name: "Birthday", date: "April 20, 2019", desc: "It's my birthday and I'm really hoping to have a relaxing night in with my best buddies! We'll make smores and cuddle my cat's new kittens!", place: "666 My House Road", drinks: drinks1, music: music1, guests: guests1)






class PartiesCollectionViewController: UICollectionViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    
    /*
     override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
     let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
     
     // Configure the cell
     
     return cell
     }
     */
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "summary", for: indexPath) as! CustomCollectionViewCell
        
        // crude implementation of populating party details that will be changed later
        if indexPath.row == 0 {
            cell.title.text = p1.name
            cell.desc.text = p1.desc
        }
        if indexPath.row == 1 {
            cell.title.text = "When and Where"
            cell.desc.text = "5:00 PM  " + p1.date + "\n\n"
            cell.desc.text = cell.desc.text! + p1.place
        }
        if indexPath.row == 2 {
            cell.title.text = "Drinks"
            for i in 0...p1.drinks.count-1 {
                cell.desc.text = cell.desc.text! + p1.drinks[i] + "\n\n"
            }
            
            cell.button.isEnabled = true
            cell.button.setTitle("I'm Bringing Something!", for: .normal)
        }
        if indexPath.row == 3 {
            cell.title.text = "Music"
            for i in 0...p1.music.count-1 {
                cell.desc.text = cell.desc.text! + p1.music[i] + "\n\n"
            }
            
            cell.button.isEnabled = true
            cell.button.setTitle("Make a Request", for: .normal)
            
        }
        if indexPath.row == 4 {
            cell.title.text = "Guests"
            for i in 0...p1.guests.count-1 {
                cell.desc.text = cell.desc.text! + p1.guests[i] + "\n\n"
            }
            
            cell.button.isEnabled = true
            cell.button.setTitle("Invite Someone", for: .normal)
            
        }


        
        return cell
        
    }
    
    
}

