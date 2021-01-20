//
//  Analytics.swift
//  OrderManagementSystem
//
//  Created by Amer Hukić on 20. 1. 2021..
//

import os.log
import Foundation

struct Analytics {
  enum Event: String {
    case orderReceived = "Order received"
    case orderPrepared = "Order prepared"
    case courierDispatched = "Courier dispatched"
    case courierArrived = "Courier arrived"
    case orderPickedUp = "Order picked up"
  }
  
  private let logger: Logger
  static let shared = Analytics()
  
  init(logger: Logger = .init()) {
    self.logger = logger
  }
  
  func log(_ event: Event) {
    logger.info("\(event.rawValue)")
  }
}
