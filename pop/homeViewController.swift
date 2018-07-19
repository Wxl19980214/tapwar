//
//  homeViewController.swift
//  pop
//
//  Created by zm on 2018/7/3.
//  Copyright © 2018年 fusion. All rights reserved.
//

import UIKit

class homeViewController: UIViewController,UITextFieldDelegate {

    
    @IBOutlet weak var player1: UITextField!
    
    @IBOutlet weak var player2: UITextField!
    

    @IBOutlet weak var letsgo: UIButton!
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        player1.text = getPlayerNames("Player One")
        player2.text = getPlayerNames("Player Two")
        letsgo.layer.cornerRadius = 20
        
        // Do any additional setup after loading the view.
    }

   
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        player1.resignFirstResponder()
        player2.resignFirstResponder()
        return true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationviewcontroller = segue.destination as? ViewController {
        
        destinationviewcontroller.playeronename = player1.text!
            savePlayerNames(player1.text!, key: "player One")
            destinationviewcontroller.playertwoname = player2.text!
            savePlayerNames(player2.text!, key: "player Two")
            
    }
    }
    
    
    
    

}
