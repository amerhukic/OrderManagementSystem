//
//  UptimeTracker.swift
//  OrderManagementSystem
//
//  Created by Amer Hukić on 30. 1. 2021..
//

import Foundation

protocol UptimeTracking {
  func currentUptimeMilliseconds() -> TimeIntervalMilliseconds
}

struct UptimeTracker: UptimeTracking {
  func currentUptimeMilliseconds() -> TimeIntervalMilliseconds {
    DispatchTime.now().uptimeMilliseconds
  }
}
