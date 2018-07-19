//
//  mostWinnerViewController.swift
//  pop
//
//  Created by zm on 2018/7/9.
//  Copyright © 2018年 fusion. All rights reserved.
//

import UIKit

class mostWinnerViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    

    @IBOutlet weak var winners: UITableView!
    
    let players = getWinnerList()
    var winnersDictionary =  [String : Int]()
    var sortplayers = [(key: String, value: Int)]()
    var bestplayer = ""
    var mostNumberOfwins = 0
   
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return winnersDictionary.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        cell.textLabel?.text =
            sortplayers[indexPath.row].key + " " + String(sortplayers[indexPath.row].value)
        
        return cell
    }
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        for winner in players {
            if winnersDictionary[winner] == nil{
                winnersDictionary[winner] = 0
            }
            let numberofwins = winnersDictionary[winner]! + 1
            winnersDictionary[winner] = numberofwins
            
            if numberofwins > mostNumberOfwins {
               bestplayer = winner
                mostNumberOfwins = numberofwins
            }
       
         }
        
    
        sortplayers = winnersDictionary.sorted{ $0.value > $1.value }
        
    
        
        for winner in sortplayers {
            
            print(winner.key)
            print(winner.value)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   

}
