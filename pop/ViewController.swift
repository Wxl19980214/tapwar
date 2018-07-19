//
//  ViewController.swift
//  pop
//
//  Created by zm on 2018/7/2.
//  Copyright © 2018年 fusion. All rights reserved.
//

import UIKit
import AVFoundation


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        feedbackGenerator.prepare()
        // Do any additional setup after loading the view, typically from a nib.
    
        label1.text = playeronename
        label2.text = playertwoname
       label1.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
       score.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
        
        player1pro.transform = CGAffineTransform(scaleX: 1.0, y: 3.0);
        
        player2pro.transform = CGAffineTransform(scaleX: 1.0, y: 3.0);
        
        timerpro.transform = CGAffineTransform(scaleX: 1.0, y: 8.0);
       
        timerpro.layer.cornerRadius = 20
        
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { (timer) in
            self.timercount = self.timercount + 1
            self.timerpro.setProgress(Float(self.timercount) / Float(10), animated: true)
            self.gameover()
            
        }
        
     
        
     
    }
    
    
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var score1: UILabel!
    @IBOutlet weak var score: UILabel!
    
    @IBOutlet weak var player1pro: UIProgressView!
    
    @IBOutlet weak var timerpro: UIProgressView!
    @IBOutlet weak var player2pro: UIProgressView!
    
 
    var timer = Timer()
    var timercount = 0
    
    

    let feedbackGenerator = UIImpactFeedbackGenerator()
    
    var playeronename = "Warriors"
    var playertwoname = "Cavs"
    
    var winnerscore = 20
    var ctap1 = 0
    var ctap2 = 0
    var s1 = 0
    var s2 = 0
    var player: AVAudioPlayer = AVAudioPlayer()
    

    
    
    
    
    
    
    @IBAction func tap1(_ sender: Any) {
      
        
    
        
        
        UIView.animate(withDuration: 0.1, delay: 0, options: UIViewAnimationOptions.allowUserInteraction, animations: {
            self.button1.transform = CGAffineTransform(scaleX: 0.7, y: 0.7)
        }, completion:nil)
        
        UIView.animate(withDuration: 0.1, delay: 0.1, options: UIViewAnimationOptions.allowUserInteraction, animations: {
            self.button1.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        }, completion:nil)
        
        playSound(named: "sound")
        feedbackGenerator.impactOccurred()
        
        
    
        
        
        ctap1 = ctap1+1
        label1.text = String(ctap1)
        player1pro.setProgress(Float(ctap1) / Float(winnerscore), animated: true)
        
    
        
        
        if (ctap1 == winnerscore){
        s1 = s1 + 1
            score.text = "score: \(s1)"
            saveWinnerName(playeronename)
            
        
        //reset and go back to victory
        reset()
        performSegue(withIdentifier: "restarter", sender: self)
        }
    }
    
    
    
    func reset(){
        
        feedbackGenerator.prepare()
        ctap1 = 0
        ctap2 = 0
        timercount = 0
        label1.text = playeronename
        label2.text = playertwoname
        player1pro.setProgress(0.00, animated: true)
        player2pro.setProgress(0.00, animated: true)
        timerpro.setProgress(0.00, animated: true)
        }
        
    func playSound(named soundName: String){
        let soundURL = Bundle.main.path(forResource: soundName, ofType: "mp3")
        player = try! AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: soundURL!) as URL, fileTypeHint: AVFileType.mp3.rawValue)
        player.play()
    }


    @IBAction func tap2(_ sender: Any) {
        
        playSound(named: "sound") //play soud¥nd
        UIView.animate(withDuration: 0.1, delay: 0, options: UIViewAnimationOptions.allowUserInteraction, animations: {
            self.button2.transform = CGAffineTransform(scaleX: 0.7, y: 0.7)
        }, completion:nil)
        
        UIView.animate(withDuration: 0.1, delay: 0.1, options: UIViewAnimationOptions.allowUserInteraction, animations: {
            self.button2.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        }, completion:nil)
        
        feedbackGenerator.impactOccurred()
        ctap2=ctap2+1
        label2.text = String(ctap2)
        player2pro.setProgress(Float(ctap2) / Float(winnerscore), animated: true)
        
        
        if(ctap2==winnerscore){
        s2 = s2 + 1
            score1.text = "score: \(s2)"
            
         saveWinnerName(playertwoname)
        
            //reset
            reset()
             performSegue(withIdentifier: "restarter1", sender: self)
        }
        
    }
    
    
    func gameover(){
        if timercount == 10 {
            if ctap1 > ctap2 {
                s1 = s1 + 1
                score.text = "score: \(s1)"
                saveWinnerName(playeronename)
                
                
                //reset and go back to victory
                reset()
                performSegue(withIdentifier: "restarter", sender: self)
                
            } else if ctap2 > ctap1 {
                
                s2 = s2 + 1
                score.text = "score: \(s2)"
                saveWinnerName(playeronename)
                
                
                //reset and go back to victory
                reset()
                performSegue(withIdentifier: "restarter1", sender: self)
            } else {
                
                let alert = UIAlertController(title: "Dumb Ass", message: "Timer is UP!🤪", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: NSLocalizedString("RESTART", comment: "Default action"), style: .default, handler: { _ in
                    self.dismiss(animated: true, completion: nil)
                }))
                self.present(alert, animated: true, completion: nil)
                
                
                
        
            }
        }
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        reset()
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
         let destinationviewcontroller = segue.destination as! Victory
        
        if (segue.identifier == "restarter") {
            destinationviewcontroller.playername = playeronename
        }
        else{
            destinationviewcontroller.playername = playertwoname
        }
        destinationviewcontroller.game = self
    }


}


