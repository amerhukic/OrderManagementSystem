//
//  StatisticsTracker.swift
//  OrderManagementSystem
//
//  Created by Amer Hukić on 20. 1. 2021.
//

import Foundation

typealias TimeIntervalMilliseconds = UInt64

/// Data structure for tracking event statistics and average waiting time
struct StatisticsTracker {
  /// Number of received orders
  private var receivedOrdersCount = 0
  /// Number of picked up orders
  private var pickedUpOrdersCount = 0
  /// Tracked order wait times
  private var orderWaitTimes = [TimeIntervalMilliseconds]()
  /// Tracked courier wait times
  private var courierWaitTimes = [TimeIntervalMilliseconds]()
  
  /// Boolean value that indicates if all received orders have been picked up
  var areAllOrdersPickedUp: Bool {
    return receivedOrdersCount == pickedUpOrdersCount
  }
  
  /// Logs the events.
  /// - Parameter events: The events to be logged
  mutating func log(_ events: [Event]) {
    events.forEach {
      switch $0 {
      case .orderReceived:
        receivedOrdersCount += 1
      case .orderPickedUp:
        pickedUpOrdersCount += 1
      case .orderWaitTime(let waitTime):
        orderWaitTimes.append(waitTime)
      case .courierWaitTime(let waitTime):
        courierWaitTimes.append(waitTime)
      default:
        break
      }
    }
  }
  
  /// Returns the average order wait time
  /// - Returns: The average order wait time
  func getAverageOrderWaitTime() -> TimeIntervalMilliseconds? {
    return orderWaitTimes.average
  }
  
  /// Returns the average courier wait time
  /// - Returns: The average courier wait time
  func getAverageCourierWaitTime() -> TimeIntervalMilliseconds? {
    return courierWaitTimes.average
  }
}
