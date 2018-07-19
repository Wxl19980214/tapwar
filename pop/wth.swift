//
//  wth.swift
//  pop
//
//  Created by zm on 2018/7/11.
//  Copyright © 2018年 fusion. All rights reserved.
//

import UIKit

class wth: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        playerimage.image = image2
        if (champs == "DWADE" || champs == "James"){
            playername.text = "3x Champs"
        }else if (champs == "Kobe") {
            playername.text = "5x Champs"
            
        }else{
            playername.text = "0x Champs"
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    var image2 = UIImage()
    var champs : String = ""
    @IBOutlet weak var playername: UILabel!
    
    @IBOutlet weak var playerimage: UIImageView!
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
