//
//  DataManagerApplication.swift
//  ESportMC3
//
//  Created by Patrick Leonardus on 04/09/19.
//  Copyright © 2019 Patrick Leonardus. All rights reserved.
//

import Foundation


class DataManagerOffer : NSObject{
    static let shared = DataManagerOffer()
    
    var clubNameList : [String] = [
        "Elite 8 Team",
        "Shooting Star Team Indonesia",
        "GIGA Team Indonesia"]
    
    var playerNameList : [String] = [
        "Randy Muhammad",
        "Kenny Deo",
        "Muhammad Rizky"]
    
    var statusList : [String] = [
        "Waiting for confirmation",
        "Rejected",
        "Accepted"]
    
    var roleList : [String] = [
        "Mid Laner",
        "Carry",
        "Off Laner",
        "Support"]
    
    var dateList : [String] = [
        "14/08/19",
        "15/08/19",
        "16/08/19"]
    
    var player : Bool = true
    
}
