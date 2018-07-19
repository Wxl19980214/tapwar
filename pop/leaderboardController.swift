//
//  leaderboardController.swift
//  pop
//
//  Created by zm on 2018/7/5.
//  Copyright © 2018年 fusion. All rights reserved.
//

import UIKit

extension MutableCollection {
    /// Shuffle the elements of `self` in-place.
    mutating func shuffle() {
        for i in indices.dropLast() {
            let diff = distance(from: i, to: endIndex)
            let j = index(i, offsetBy: numericCast(arc4random_uniform(numericCast(diff))))
            swapAt(i, j)
        }
    }
}

class leaderboardController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    //makr tableview
    
    var players2 : [String] = getWinnerList()
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return players2.count
    }
    
    
   let tapme : Int = 4
    //var players : [String] = ["James","Kobe","T-Mac","DWADE","CP3"]
    
    let playerssize : Int = 5
    var row : Int = 0
    var usecell = matchtableviewcontrollerTableViewCell()
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
      let cell = tableView.dequeueReusableCell(withIdentifier: "king", for: indexPath) as! matchtableviewcontrollerTableViewCell
    
       // cell.contentView.backgroundColor = UIColor.white
       
            cell.textLabel?.text = players2[indexPath.row]
        cell.image1.layer.cornerRadius = 20
    
        if let text = cell.textLabel?.text{
            if text == "Kobe" {
                
                cell.image1.image = #imageLiteral(resourceName: "lakers")
                
            }else if text == "James" {
                
                cell.image1.image = #imageLiteral(resourceName: "lbj")
            
            }else if text == "DWADE" {
            
                cell.image1.image = #imageLiteral(resourceName: "dwade")
            
            }else if text == "T-Mac"{
                
                cell.image1.image = #imageLiteral(resourceName: "tmac")
            
            }else{
                
                cell.image1.image = #imageLiteral(resourceName: "cp3")
            }
 
    }
       
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        usecell = tableView.dequeueReusableCell(withIdentifier: "king", for: indexPath) as! matchtableviewcontrollerTableViewCell
        
        // cell.contentView.backgroundColor = UIColor.white
        
        usecell.textLabel?.text = players2[indexPath.row]
        usecell.image1.layer.cornerRadius = 20
        
        if let text = usecell.textLabel?.text{
            if text == "Kobe" {
                
                usecell.image1.image = #imageLiteral(resourceName: "lakers")
                
            }else if text == "James" {
                
                usecell.image1.image = #imageLiteral(resourceName: "lbj")
                
            }else if text == "DWADE" {
                
                usecell.image1.image = #imageLiteral(resourceName: "dwade")
                
            }else if text == "T-Mac"{
                
                usecell.image1.image = #imageLiteral(resourceName: "tmac")
                
            }else{
                
                usecell.image1.image = #imageLiteral(resourceName: "cp3")
            }
            
        }
        
        
        
        
        
        
        row = indexPath.row
        performSegue(withIdentifier: "profile", sender: self)
        
        /*     if (indexPath.row == tapme){
            
            
            print(String(indexPath.row+1))
            
            
            let alert = UIAlertController(title: "Blublublu", message: "YOU ARE SO SMART!!😱", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("Continue", comment: "Default action"), style: .default, handler: { _ in
                NSLog("The \"OK\" alert occured.")
            }))
            self.present(alert, animated: true, completion: nil)
            
        } else {
            
            let alert = UIAlertController(title: "BIUBIUBIU", message: "YOU ARE SO DUMB!!💩", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("Continue", comment: "Default action"), style: .default, handler: { _ in
                NSLog("The \"OK\" alert occured.")
            }))
            self.present(alert, animated: true, completion: nil)
            
            
        }
       */
        
    }
    
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationviewcontroller = segue.destination as? wth
            
    destinationviewcontroller?.title = players2[row]
    destinationviewcontroller?.image2 = usecell.image1.image!
    destinationviewcontroller?.champs = players2[row]
    
    }
    
  /*   func tableView(_ tableView: UITableView, commitEditingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath){
        if editingStyle == .delete{
            print("Delete")
            self.players2.remove(at: indexPath.row)
            removeWinnerName(index: indexPath.row)
            self.tableView.deleteRows(at: [indexPath],with: .automatic)
        }
    }
    */
    
    
    @IBAction func close(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func clearLeaderBoard(_ sender: Any) {
        deleteWinnerName()
        players2 = []
        UIView.animate(withDuration: 0.3) {
            self.tableview.alpha = 0
        }
    }
    
    @IBOutlet weak var tableview: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       // players.shuffle()
       // let date = Date()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

   
        
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
