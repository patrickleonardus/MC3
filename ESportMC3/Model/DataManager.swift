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
    
    let clubNameList : [String] = [
        "Rex Regum Qeon",
        "PT Evos Esports Indonesia",
        "PT NXL Esports Indonesia"]
    
    let playerNameList : [String] = [
        "Randy Muhammad",
        "Kenny Deo",
        "Muhammad Rizky"]
    
    let statusList : [String] = [
        "Menunggu konfirmasi",
        "Ditolak",
        "Diterima"]
    
    let roleList : [String] = [
        "Mid Laner",
        "Carry",
        "Off Laner",
        "Support"]
    
    let dateList : [String] = [
        "14/08/19",
        "15/08/19",
        "16/08/19"]
    
    let player : Bool = true
    
}
