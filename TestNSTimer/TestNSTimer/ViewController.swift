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

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        backgroundTimer = BackgroundTimer(duration: 3.0, block: backgroundTimerFiredBlock(timer:))
        backgroundTimer?.schedule()
    }

    func backgroundTimerFiredBlock(timer: Timer) -> Void {
        print("[BackgroundTimer] Timer Fired")
    }
 }

