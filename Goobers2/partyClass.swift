//
//  partyClass.swift
//  Goobers
//
//  Created by Jack Schaeffer on 4/22/19.
//  Copyright © 2019 Nolan Daniels. All rights reserved.
//

import Foundation

class Party {
    
    var name:String
    var date:String
    var desc:String
    var place:String
    var drinks:Array<String> //will implement a class for drinks later
    var music:Array<String> //will implement a class for music later
    var guests:Array<String> //will implement a class for music later
    
    init(name:String, date:String, desc:String, place:String, drinks:Array<String>, music:Array<String>, guests:Array<String>){
        self.name = name
        self.date = date
        self.desc = desc
        self.place = place
        self.drinks = drinks
        self.music = music
        self.guests = guests
    }
    
    
}

