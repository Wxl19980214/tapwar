//
//  Victory.swift
//  pop
//
//  Created by zm on 2018/7/2.
//  Copyright © 2018年 fusion. All rights reserved.
//

import UIKit

class Victory: UIViewController {

    var game : ViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playerOnename.text = playername
        // Do any additional setup after loading the view.
    }

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func disss(_ sender: Any) {
        
        dismiss(animated: false, completion: {
            
        self.game.dismiss(animated: false, completion: nil)
            
        })
    }
    
    
    @IBOutlet weak var playerOnename: UILabel!
    var playername = "Warrior"
    
    
    @IBAction func restart(_ sender: Any) {
         dismiss(animated: true, completion: nil)
    dismiss(animated: false, completion: {
    
        self.game.dismiss(animated: false, completion: nil)
        
    })
    
        
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
