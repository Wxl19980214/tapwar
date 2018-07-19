//
//  Appdata.swift
//  pop
//
//  Created by zm on 2018/7/6.
//  Copyright © 2018年 fusion. All rights reserved.
//

import Foundation


func savePlayerNames(_ name: String, key: String){
    UserDefaults.standard.set(name, forKey: key)
}

func getPlayerNames(_ key: String) -> String{
    return UserDefaults.standard.string(forKey: key) ?? key
}


func getWinnerList() -> [String]{
    if let listofwinners = UserDefaults.standard.stringArray(forKey: "winners") {
        return listofwinners
    }else{
        return []
    }
    
}



func saveWinnerName(_ name: String){
    
    var Winners =  getWinnerList()
    
    Winners.append(name)
    
    UserDefaults.standard.set(Winners, forKey: "winners")
    
}

func deleteWinnerName(){
    let newWinners : [String] = []
    UserDefaults.standard.set(newWinners, forKey: "winners")
    
}
    
    

