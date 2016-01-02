//
//  ViewController.swift
//  Multiplayer-game-oop
//
//  Created by Jonatan Knudsen on 01/01/2016.
//  Copyright © 2016 Jonatan Knudsen. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var redPlayer: Charactor!
    var bluePlayer: Charactor!
    var countDownTimes = 5
    
    var backgroundSnd: AVAudioPlayer!
    var redAttackSnd: AVAudioPlayer!
    var blueAttackSnd: AVAudioPlayer!
    var playerDieSnd: AVAudioPlayer!
    
    
    @IBOutlet weak var RedPlayerImg: UIImageView!
    
    @IBOutlet weak var BluePlayerImg: UIImageView!
    
    @IBOutlet weak var winningScreenDimm: UIView!
    
    @IBOutlet weak var winningScreenLbl: UIButton!
    
    @IBOutlet weak var restartGameBut: UIButton!
    
    @IBOutlet weak var infoLbl: UILabel!
    
    @IBOutlet weak var RedPlayerHpLbl: UILabel!

    @IBOutlet weak var BluePlayerHpLbl: UILabel!
    
    @IBOutlet weak var RedAttackLbl: UILabel!
    
    @IBOutlet weak var BlueAttackLbl: UILabel!
    
    @IBOutlet weak var startBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let backgroundSndURL = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("background_noise", ofType: "wav")!)
        let redAttackSndURL = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("club-bash", ofType: "wav")!)
        let blueAttackSndURL = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("knife-stab", ofType: "wav")!)
        let playerDieSndURL = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("die", ofType: "wav")!)
        
        do {
            try backgroundSnd = AVAudioPlayer(contentsOfURL: backgroundSndURL)
            try redAttackSnd = AVAudioPlayer(contentsOfURL: redAttackSndURL)
            try blueAttackSnd = AVAudioPlayer(contentsOfURL: blueAttackSndURL)
            try playerDieSnd = AVAudioPlayer(contentsOfURL: playerDieSndURL)
            backgroundSnd.prepareToPlay()
            redAttackSnd.prepareToPlay()
            blueAttackSnd.prepareToPlay()
            playerDieSnd.prepareToPlay()
        } catch let err as NSError {
            print(err.debugDescription)
        }
        
        generatePlayers()
        backgroundSnd.numberOfLoops = -1
        backgroundSnd.play()
        
    }
    
    func generatePlayers() {
        bluePlayer = Charactor(attackPwr: 6, name: "The Slave")
        updateHpLbl("blue")
        redPlayer = Charactor(attackPwr: 6, name: "The One")
        updateHpLbl("red")
    }
    
    func updateHpLbl(player: String) {
        if player == "red" {
            RedPlayerHpLbl.text = "\(hpToIs(redPlayer.hp))"
        } else if player == "blue" {
            BluePlayerHpLbl.text = "\(hpToIs(bluePlayer.hp))"
        }
    }
    
    func hpToIs(var hp: Int) -> String {
        var hpString = ""
        hp /= 2
        while hp > 0 {
            hpString += "I"
            hp--
        }
        return hpString
    }
    
    func countDown() {
        if countDownTimes > 0 {
            infoLbl.text = "Get ready in \(countDownTimes)"
            countDownTimes--
            NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: "countDown", userInfo: nil, repeats: false)
        } else {
            infoLbl.text = "Fight!"
        }
    }
    
    @IBAction func onRestartPressed(sender: AnyObject) {
    }

    @IBAction func onRedAttackPressed(sender: AnyObject) {
        if bluePlayer.attemptAttack(redPlayer.attackPwr) {
            if redAttackSnd.playing {
                redAttackSnd.stop()
                redAttackSnd.currentTime = 0
            }
            redAttackSnd.play()
            updateHpLbl("blue")
        }
    }
    
    @IBAction func onBlueAttackPressed(sender: AnyObject) {
        if redPlayer.attemptAttack(bluePlayer.attackPwr) {
            if blueAttackSnd.playing {
                blueAttackSnd.stop()
                blueAttackSnd.currentTime = 0
            }
            blueAttackSnd.play()
            updateHpLbl("red")
        }
    }

    @IBAction func onStartPressed(sender: AnyObject) {
        countDown()
        startBtn.hidden = true
    }
}

