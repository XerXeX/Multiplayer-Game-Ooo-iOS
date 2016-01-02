//
//  ViewController.swift
//  Multiplayer-game-oop
//
//  Created by Jonatan Knudsen on 01/01/2016.
//  Copyright © 2016 Jonatan Knudsen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
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
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func onRestartPressed(sender: AnyObject) {
    }

    @IBAction func onRedAttackPressed(sender: AnyObject) {
    }
    
    @IBAction func onBlueAttackPressed(sender: AnyObject) {
    }

    @IBAction func onStartPressed(sender: AnyObject) {
    }
}

