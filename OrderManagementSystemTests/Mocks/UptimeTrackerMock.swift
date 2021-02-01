//
//  UptimeTrackerMock.swift
//  OrderManagementSystemTests
//
//  Created by Amer Hukić on 30. 1. 2021.
//

import Foundation
@testable import OrderManagementSystem

struct UptimeTrackerMock: UptimeTracking {
  func currentUptimeMilliseconds() -> TimeIntervalMilliseconds {
    return 0
  }
}
