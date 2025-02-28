///
/// Copyright © 2020-2024 El Machine 🤖
/// https://el-machine.com/
///
/// Licensed under the Apache License, Version 2.0 (the "License");
/// you may not use this file except in compliance with the License.
/// You may obtain a copy of the License at
///
/// 1) LICENSE file
/// 2) https://apache.org/licenses/LICENSE-2.0
///
/// Unless required by applicable law or agreed to in writing, software
/// distributed under the License is distributed on an "AS IS" BASIS,
/// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
/// See the License for the specific language governing permissions and
/// limitations under the License.
///
/// Created by Alex Kozin
/// 2020 El Machine

#if canImport(CoreMotion)
import CoreMotion.CMMotionManager
import Wand

/// Ask
///
/// |{ (data: CMMagnetometerData) in
///
/// }
///
@available(macOS, unavailable)
@available(visionOS, unavailable)
extension CMMagnetometerData: @retroactive Asking {}
extension CMMagnetometerData: @retroactive AskingNil, @retroactive Wanded {

    @inline(__always)
    public
    static
    func wand<T>(_ wand: Wand, asks ask: Ask<T>) {

        // Save ask
        guard wand.answer(the: ask) else {
            return
        }
        
        //Request for a first time

        // Prepare context
        let source: CMMotionManager =       wand.obtain()
        source.magnetometerUpdateInterval = wand.get() ?? 0.1

        let q: OperationQueue =             wand.get() ?? .init()

        // Set cleaner
        wand.setCleaner(for: ask) {
            source.stopMagnetometerUpdates()
        }

        // Request
        source.startMagnetometerUpdates(to: q) { (data, error) in
            wand.addIf(exist: data)
            wand.addIf(exist: error)
        }

    }
}

#endif
