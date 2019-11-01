//
//  BackgroundTimer.swift
//  TestNSTimer
//
//  Created by he.wu on 2019/11/01.
//  Copyright © 2019 he.wu. All rights reserved.
//

import Foundation

final class BackgroundTimer {
    private var timer: Timer?

    private var block: (Timer) -> Void
    private let duration: TimeInterval
    
    private let backgroundQueue = DispatchQueue(label: "backgroundQueue")
    
    init(duration: TimeInterval, block: @escaping (Timer) -> Void) {
        self.duration = duration
        self.block = block
    }
    
    func schedule() {
        backgroundQueue.async { [weak self] in
            guard let self = self else {
                print("[BackgroundTimer] self is nil ... ")
                return
            }
            print("[BackgroundTimer] Will be scheduled ... ")
            Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: self.block)
            print("[BackgroundTimer] Start scheduled ... ")
        }
    }
}

