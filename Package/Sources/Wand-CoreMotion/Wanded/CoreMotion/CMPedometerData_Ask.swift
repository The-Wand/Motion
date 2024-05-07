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
import CoreMotion.CMPedometer
import Wand

/// Ask
///
/// |{ (data: CMPedometerData) in
///
/// }
///
@available(visionOS, unavailable)
extension CMPedometerData: AskingNil, Wanded {

    @inline(__always)
    public
    static func wand<T>(_ wand: Wand, asks ask: Ask<T>) {

        //Save ask
        guard wand.answer(the: ask) else {
            return
        }

        //Request for a first time

        //Prepare context
        let source: CMPedometer = wand.obtain()
        let date: Date          = wand.get() ?? Date()

        //Set the cleaner
        wand.setCleaner(for: ask) {
            source.stopUpdates()
        }

        //Make request
        source.startUpdates(from: date) { (data, error) in
            if let error = error {
                wand.add(error)
                return
            }

            wand.add(data!)
        }

    }

}

#endif
