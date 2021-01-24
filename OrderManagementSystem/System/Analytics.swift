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
    case orderPrepared(orderId: String)
    case courierDispatched(orderId: String)
    case courierArrived(orderId: String)
    case orderPickedUp(orderId: String)
    
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
      }
    }
  }
  
  private let logger: Logger
  // TODO: Izbrisati ako se ne koristi singleton
  static let shared = Analytics()
  
  private var receivedOrdersCount = 0
  private var pickedUpOrdersCount = 0
  private var shouldPrintStatistics = false
  private var orderTimeDictionary = ThreadSafeDictionary<String, DispatchTime>()
  private var courierTimeDictionary = ThreadSafeDictionary<String, DispatchTime>()
  
  // FIFO calculation
  private var orderTimeQueue = ThreadSafeQueue<DispatchTime>()
  private var courierTimeQueue = ThreadSafeQueue<DispatchTime>()
  
  
  

  init(logger: Logger = .init()) {
    self.logger = logger
  }
  
  func log(_ event: Event) {
    self.logger.info("\(event.description)")

    
//    switch event {
//    case .orderReceived:
//      receivedOrdersCount += 1
//    case .orderPrepared(let orderId):
//     // orderTimeDictionary[orderId] = DispatchTime.now()
//      orderTimeQueue.push(DispatchTime.now())
//    case .orderPickedUp(let orderId):
//      pickedUpOrdersCount += 1
//      let orderTime = orderTimeQueue.pop()!.uptimeNanoseconds //todo force unwr. ! handling
//      let courierTime = courierTimeQueue.pop()!.uptimeNanoseconds
//      print("AMER DIFFERENCE: \(getTimeDifference(orderTime, courierTime)) ms")
//    case .courierArrived(let orderId):
////      courierTimeDictionary[orderId] = DispatchTime.now()
//      courierTimeQueue.push(DispatchTime.now())
//      break
//    default:
//      break
//    }
  }
}
