//
//  Experiments.swift
//  WatchPlayTests
//
//  Created by Aleksander Kozin on 11/8/2569 BE.
//  Copyright © 2569 BE El Machine, Alex Kozin. All rights reserved.
//

import Foundation
import Testing
import WandMotion

@Test
func experiment() {
    
    |.every { (direction: Selector.Direction) in
        print(direction)
    }
    
}

struct Selector {

    @available(macOS, unavailable)
    @available(visionOS, unavailable)
    struct Direction: Ask.Nil {
        
        let value: Double
        
        @inline(__always)
        public
        static
        func ask<C, T>(with scope: C, ask: Ask<T>) -> Core {
           
            let wand = Core.to(scope)
            
            //Save ask
            guard wand.append(ask: ask) else {
                return wand
            }
            
            //Request for a first time
            
            //Prepare context
            return wand | ask.depend { (attitude: CMAttitude) in
                
                let yaw = attitude.yaw
                if (wand.get() ?? 0) - yaw > 1 {
                    let d = Direction(value: yaw)
                    wand.add(d)
                }
            }
        }
        
    }
    
    
}
