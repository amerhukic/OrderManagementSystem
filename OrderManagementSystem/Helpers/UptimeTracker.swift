//
//  UptimeTracker.swift
//  OrderManagementSystem
//
//  Created by Amer Hukić on 30. 1. 2021.
//

import Foundation

/// Protocol for tracking system uptime
protocol UptimeTracking {
  func currentUptimeMilliseconds() -> TimeIntervalMilliseconds
}

/// Uptime tracker for system uptime
struct UptimeTracker: UptimeTracking {
  
  /// Returns current uptime in milliseconds.
  /// - Returns: The current uptime in milliseconds
  func currentUptimeMilliseconds() -> TimeIntervalMilliseconds {
    return DispatchTime.now().uptimeMilliseconds
  }
}
