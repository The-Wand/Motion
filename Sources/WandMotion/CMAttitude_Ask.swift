///
/// Copyright 2020 Alexander Kozin
///
/// Licensed under the Apache License, Version 2.0 (the "License");
/// you may not use this file except in compliance with the License.
/// You may obtain a copy of the License at
///
///     http://www.apache.org/licenses/LICENSE-2.0
///
/// Unless required by applicable law or agreed to in writing, software
/// distributed under the License is distributed on an "AS IS" BASIS,
/// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
/// See the License for the specific language governing permissions and
/// limitations under the License.
///
/// Created by Alex Kozin
/// El Machine 🤖

#if canImport(CoreMotion)
import CoreMotion
import Wand

/// Ask
///
/// |{ (attitude: CMAttitude) in
///
/// }
///
@available(macOS, unavailable)
@available(visionOS, unavailable)
extension CMAttitude: Ask.Nil, Wanded {
    
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

        //Make request
        return wand | ask.depend { (motion: CMDeviceMotion) in
            wand.add(motion.attitude)
        }
    }

}

#endif
