//
//  ViewController.swift
//  TestNSTimer
//
//  Created by he.wu on 2019/11/01.
//  Copyright © 2019 he.wu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var backgroundTimer: BackgroundTimer?
    var gcdTimer: GCDTimer?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        backgroundTimer = BackgroundTimer(duration: 3.0, block: backgroundTimerFiredBlock(timer:))
        backgroundTimer?.schedule()
        
        gcdTimer =  GCDTimer(duration: 3.0, block: gcdTimerFiredBlock)
        gcdTimer?.schedule()
    }

    func backgroundTimerFiredBlock(timer: Timer) -> Void {
        NSLog("[BackgroundTimer] Timer Fired")
    }
    
    func gcdTimerFiredBlock() -> Void {
        DispatchQueue.main.async {
            NSLog("[GCDTimer] Timer Fired")
        }
    }
 }

