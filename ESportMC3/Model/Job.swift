//
//  Job.swift
//  ESportMC3
//
//  Created by Patrick Leonardus on 22/08/19.
//  Copyright © 2019 Patrick Leonardus. All rights reserved.
//

import Foundation

struct Job {
    var name: String
    var salary: String
    var role: String
    var gender: String
    
    
    init(name : String, salary : String, role : String, gender : String) {
        self.name = name
        self.salary = salary
        self.role = role
        self.gender = gender
    }
    
    static func getJobs() -> [Job] {
        return [
            Job(name: "Dota 2 Championship 2019", salary: "Rp.3.000.000 - Rp.5.000.000", role: "Roaming Support", gender: "Male"),
             Job(name: "Dota 2 Tournament 2019", salary: "Rp.3.000.000 - Rp.5.000.000", role: "Hard Support", gender: "Male"),
             Job(name: "Dota 2 Championship League", salary: "Rp.3.000.000 - Rp.5.000.000", role: "Offlaner", gender: "Male"),
             Job(name: "Dota 2 Indonesia Professional", salary: "Rp.3.000.000 - Rp.5.000.000", role: "Solo Mid", gender: "Female")
            
        ]
    }
}

protocol JobListener {
    func didTap(job : Job)
}
