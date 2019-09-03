//
//  Team.swift
//  ESportMC3
//
//  Created by Patrick Leonardus on 22/08/19.
//  Copyright © 2019 Patrick Leonardus. All rights reserved.
//

import Foundation

struct Team {
    
    var image: String
    var name: String
    var location: String
    var description : String
    var alias : String
    
    
    init(image : String, name : String, location : String, description : String, alias : String) {
        self.image = image
        self.name = name
        self.location = location
        self.description = description
        self.alias = alias
    }
    
    static func getTeams() -> [Team] {
        return [
            Team(image: "nxl", name: "NXL Team", location: "Jakarta", description: "Mutual respect for each other, a commitment to excellence, innovation, integrity and quality in everything we do.", alias: "NXL>"),
            Team(image: "Team2", name: "Evos Team", location: "Tangerang", description: "Mutual respect for each other, a commitment to excellence, innovation, integrity and quality in everything we do.", alias: "Evos"),
            Team(image: "Team3", name: "RRQ", location: "Serpong", description: "Mutual respect for each other, a commitment to excellence, innovation, integrity and quality in everything we do.", alias: "RRQ"),
            Team(image: "Team4", name: "Elite8 Team", location: "Jakarta", description: "Mutual respect for each other, a commitment to excellence, innovation, integrity and quality in everything we do.", alias: "E8")
        ]
    }
    
}

protocol TeamListener {
    func didTap(team : Team)
}
