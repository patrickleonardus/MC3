//
//  Player.swift
//  ESportMC3
//
//  Created by Patrick Leonardus on 20/08/19.
//  Copyright © 2019 Patrick Leonardus. All rights reserved.
//

import Foundation

struct Player{
    var image : String
    var name : String
    var username : String?
    var location : String
    var age : String?
    var gender : String?
    var jobAvailability : String?
    var description : String?
    var rank : String?
    var dateOfBirth : String?
    var password : String?
    var email : String?
    
    
    init(image: String, name: String, location: String, jobAvailability : String) {
        self.image = image
        self.name = name
        self.location = location
        self.jobAvailability = jobAvailability
    }
    
    init(image: String, name: String, username: String, location: String, age: String, gender: String, jobAvailability : String, description : String, rank : String) {
        self.image = image
        self.name = name
        self.username = username
        self.location = location
        self.age = age
        self.gender = gender
        self.jobAvailability = jobAvailability
        self.description = description
        self.rank = rank
    }
    
    static func getPlayers() -> [Player] {
        return [

            Player(image: "Players1", name: "Angel Clara", username: "angelss", location: "Jakarta", age: "19", gender: "Female", jobAvailability: "Available", description: "I am a Dota player who had been playing for 2 years", rank: "Divine"),
            Player(image: "Players2", name: "Nixia", username: "ladynixia", location: "Bandung", age: "23", gender: "Female", jobAvailability: "Available", description: "Dota 2 is my life", rank: "Ancient"),
            Player(image: "Players3", name: "Sarah Viloid", username: "sarahviloid", location: "Jakarta", age: "18", gender: "Female", jobAvailability: "Not Available", description: "1st 2017 Dota 2 Tournament Championship, 2nd Dota 2 League Championship Regional Indonesia 2017, 1st Dota 2 Tournament  Championship 2019", rank: "Immortal"),
            
            Player(image: "people1", name: "Tobias Justin", username: "jessnolimit20", location: "Jakarta", age: "23", gender: "Male", jobAvailability: "Available", description: "1st 2017 Dota 2 Tournament Championship, 2nd Dota 2 League Championship Regional Indonesia 2017, 1st Dota 2 Tournament  Championship 2019", rank: "Immortal"),
            Player(image: "people2", name: "Qorygore", username: "Qorygoreee", location: "Jakarta", age: "28", gender: "Male", jobAvailability: "Available", description: "1st 2017 Dota 2 Tournament Championship, 2nd Dota 2 League Championship Regional Indonesia 2017, 1st Dota 2 Tournament  Championship 2019", rank: "Legend"),
            Player(image: "people3", name: "Dany", username: "DanyDewaGemah", location: "Tangerang", age: "18", gender: "Male", jobAvailability: "Available", description: "1st 2017 Dota 2 Tournament Championship, 2nd Dota 2 League Championship Regional Indonesia 2017, 1st Dota 2 Tournament  Championship 2019", rank: "Archon")
            
        ]
    }
}


protocol PlayerListener {
    func didTap(player: Player)
}

