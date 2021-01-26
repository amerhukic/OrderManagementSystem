//
//  Statistics.swift
//  OrderManagementSystem
//
//  Created by Amer Hukić on 20. 1. 2021..
//

import Foundation

// TODO: maybe rename to AverageWaitTimeTracker ?
struct Statistics {
  // todo private
   var receivedOrdersCount = 0
   var pickedUpOrdersCount = 0
  private var orderWaitTimes = [UInt64]()
  private var courierWaitTimes = [UInt64]()
  
  var areAllOrdersPickedUp: Bool {
    receivedOrdersCount == pickedUpOrdersCount
  }
  
  // TODO: mora li biti thread safe zbog += 1 ???
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
  
  func getAverageOrderWaitTime() -> UInt64 {
    let sum = orderWaitTimes.reduce(0, +)
    // TODO: check if we loose precision here because of int division
    return sum / UInt64(orderWaitTimes.count)
  }
  
  func getAverageCourierWaitTime() -> UInt64 {
    let sum = courierWaitTimes.reduce(0, +)
    // TODO: check if we loose precision here because of int division
    return sum / UInt64(orderWaitTimes.count)
  }
}
