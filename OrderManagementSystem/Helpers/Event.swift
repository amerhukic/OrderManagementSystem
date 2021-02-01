//
//  Event.swift
//  OrderManagementSystem
//
//  Created by Amer Hukić on 25. 1. 2021.
//

import Foundation

enum Event {
  case orderReceived
  case orderPrepared
  case courierDispatched
  case courierArrived
  case orderPickedUp
  case orderWaitTime(TimeIntervalMilliseconds)
  case courierWaitTime(TimeIntervalMilliseconds)
  case averageOrderWaitTime(TimeIntervalMilliseconds)
  case averateCourierWaitTime(TimeIntervalMilliseconds)
  
  var description: String {
    switch self {
    case .orderReceived:
      return "Order received"
    case .orderPrepared:
      return "Order prepared"
    case .courierDispatched:
      return "Courier dispatched"
    case .courierArrived:
      return "Courier arrived"
    case .orderPickedUp:
      return "Order picked up"
    case .orderWaitTime(let waitTimeMs):
      return "Food wait time: \(waitTimeMs) ms"
    case .courierWaitTime(let waitTimeMs):
      return "Courier wait time: \(waitTimeMs) ms"
    case .averageOrderWaitTime(let waitTimeMs):
      return "Average order wait time: \(waitTimeMs) ms"
    case .averateCourierWaitTime(let waitTimeMs):
      return "Average courier wait time: \(waitTimeMs) ms"
    }
  }
}
