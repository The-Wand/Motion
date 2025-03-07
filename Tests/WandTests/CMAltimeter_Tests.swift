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

#if canImport(CoreMotion) && !targetEnvironment(simulator) && !os(macOS)
import CoreMotion
import XCTest

import Wand_CoreMotion
import Wand

class CMAltimeter_Tests: XCTestCase {
    
    //TODO: Rewrite to CMAltimeter
    func test_CMAltitudeData() {
        let e = expectation()

        |.one { (altitude: CMAttitude) in
            e.fulfill()
        }

        waitForExpectations()
    }
    
//    func test_CMAbsoluteAltitudeData() {
//        let e = expectation()
//
//        |.one { (altitude: CMAbsoluteAltitudeData) in
//            e.fulfill()
//        }
//
//        waitForExpectations()
//    }

    func test_CMAltimeter() {
        XCTAssertNotNil(CMAltimeter.self|)
    }

}

#endif
