//
//  Analytics.swift
//  OrderManagementSystem
//
//  Created by Amer Hukić on 20. 1. 2021..
//

import os.log
import Foundation

struct Analytics {
  enum Event {
    case orderReceived
    case orderPrepared
    case courierDispatched
    case courierArrived
    case orderPickedUp
    case orderWaitTime(UInt64)
    case courierWaitTime(UInt64)
    
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
      }
    }
  }
  
  private let logger: Logger
  private let logDispatchQueue = DispatchQueue(label: "logging.serial.queue")

  init(logger: Logger = .init()) {
    self.logger = logger
  }
  
  func log(_ events: Event...) {
    logDispatchQueue.async {
      events.forEach {
        self.logger.info("\($0.description)")
      }
    }
  }
}
