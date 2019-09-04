//
//  dataManager.swift
//  esportMC3
//
//  Created by Aditya Sanjaya on 23/08/19.
//  Copyright © 2019 Aditya. All rights reserved.
//

import Foundation

class DataManager : NSObject{
    static let shared = DataManager()
    
    var clubNameList : [String] = [
        "Rex Regum Qeon",
        "PT Evos Esports Indonesia",
        "PT NXL Esports Indonesia"]
    
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
