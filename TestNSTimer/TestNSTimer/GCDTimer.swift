//
//  GCDTimer.swift
//  TestNSTimer
//
//  Created by he.wu on 2019/11/01.
//  Copyright © 2019 he.wu. All rights reserved.
//

import Foundation

final class GCDTimer {
    private lazy var timer: DispatchSourceTimer? = {
        let timer = DispatchSource.makeTimerSource(queue: gcdQueue)
        timer.schedule(deadline: .now() + self.duration, repeating: self.duration)
        timer.setEventHandler { [weak self] in
            NSLog("[GCDTimer] Timer Prepare Scheduled")
            self?.block?()
        }
        return timer
    }()

    private var block: (() -> Void)?
    private let duration: TimeInterval
    private let gcdQueue = DispatchQueue(label: "GCDTimerQueue", attributes: .concurrent)
        
    init(duration: TimeInterval, block: @escaping () -> Void) {
        self.duration = duration
        self.block = block
    }
    
    func schedule() {
        if timer == nil {
            NSLog("[GCDTimer] Timer is nil")
            return
        }
        NSLog("[GCDTimer] Timer will be scheduled")
        timer?.resume()
    }
}
