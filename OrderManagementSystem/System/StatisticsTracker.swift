//
//  StatisticsTracker.swift
//  OrderManagementSystem
//
//  Created by Amer Hukić on 20. 1. 2021.
//

import Foundation

typealias TimeIntervalMilliseconds = UInt64

struct StatisticsTracker {
  private var receivedOrdersCount = 0
  private var pickedUpOrdersCount = 0
  private var orderWaitTimes = [TimeIntervalMilliseconds]()
  private var courierWaitTimes = [TimeIntervalMilliseconds]()
  
  var areAllOrdersPickedUp: Bool {
    return receivedOrdersCount == pickedUpOrdersCount
  }
  
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
  
  func getAverageOrderWaitTime() -> TimeIntervalMilliseconds? {
    return orderWaitTimes.average
  }
  
  func getAverageCourierWaitTime() -> TimeIntervalMilliseconds? {
    return courierWaitTimes.average
  }
}
