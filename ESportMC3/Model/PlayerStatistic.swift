//
//  PlayerStatistic.swift
//  ESportMC3
//
//  Created by Beny Untoro on 03/09/19.
//  Copyright © 2019 Patrick Leonardus. All rights reserved.
//

import Foundation

struct PlayerStatistic {
    var win: Int?
    var lose: Int?
    var avgWinRate: Int
    var kills, deaths, assists: Int
    var goldPerMin: Int
    var xpPerMin: Int
    var killsMax, deathsMax, assistsMax: Int
    var goldPerMinMax: Int
    var xpPerMinMax: Int
    
    init(win: Int?, lose: Int?, avgWinRate: Int, kills: Int, deaths: Int, assists: Int, goldPerMin: Int, xpPerMin: Int, killsMax: Int, deathsMax: Int, assistsMax: Int, goldPerMinMax: Int, xpPerMinMax: Int) {
        self.win = win
        self.lose = lose
        self.avgWinRate = avgWinRate
        self.kills = kills
        self.deaths = deaths
        self.assists = assists
        self.goldPerMin = goldPerMin
        self.xpPerMin = xpPerMin
        self.killsMax = killsMax
        self.deathsMax = deathsMax
        self.assistsMax = assistsMax
        self.goldPerMinMax = goldPerMinMax
        self.xpPerMinMax = xpPerMinMax
    }
}
