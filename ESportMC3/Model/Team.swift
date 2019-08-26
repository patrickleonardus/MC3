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
    
    
    init(image : String, name : String, location : String) {
        self.image = image
        self.name = name
        self.location = location
    }
    
    static func getTeams() -> [Team] {
        return [
            Team(image: "Team1", name: "NXL Team", location: "Jakarta"),
            Team(image: "Team2", name: "Evos Team", location: "Tangerang"),
            Team(image: "Team3", name: "RRQ", location: "Serpong"),
            Team(image: "Team4", name: "Elite8 Team", location: "Jakarta")
        ]
    }
    
}

protocol TeamListener {
    func didTap(team : Team)
}
