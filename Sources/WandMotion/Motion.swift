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

typealias Attitude          = CMAttitude

#if !os(macOS) && !os(visionOS)
typealias AltitudeData      = CMAltitudeData
#endif

typealias DeviceMotion      = CMDeviceMotion
typealias MagnetometerData  = CMMagnetometerData
typealias GyroData          = CMGyroData
typealias PedometerData     = CMPedometerData
typealias PedometerEvent    = CMPedometerEvent

//TODO: Test isRelativeAltitudeAvailable
//import Wand
//
//@available(iOS 13.0, *)
//public
//extension Wand.Error {
//
//    static func motion(_ code: VNErrorCode, reason: String? = nil) -> Error {
//        Self(code: code.rawValue, reason: reason ?? "")
//    }
//
//}

#endif
