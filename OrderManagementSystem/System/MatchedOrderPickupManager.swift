//
//  MatchedOrderPickupManager.swift
//  OrderManagementSystem
//
//  Created by Amer Hukić on 26. 1. 2021..
//

import Foundation

class MatchedOrderPickupManager {
  private var orderDictionary = [String: OrderData]()
  private var courierDictionary = [String: CourierData]()
  private let lock = NSLock()
  private let uptimeTracker: UptimeTracking
  
  init(uptimeTracker: UptimeTracking = UptimeTracker()) {
    self.uptimeTracker = uptimeTracker
  }
  
  func sendCourierForPickup(_ courier: Courier, onOrderPickedUp orderPickupHandler: (TimeIntervalMilliseconds) -> Void) {
    let timePoint = uptimeTracker.currentUptimeMilliseconds()
    lock.lock()
    defer {
      lock.unlock()
    }
    guard let orderData = orderDictionary[courier.orderId] else {
      courierDictionary[courier.orderId] = CourierData(courier: courier, arrivalTimePoint: timePoint)
      return
    }
    let timeDifferenceMs = timePoint.absoluteDifference(from: orderData.preparationTimePoint)
    orderPickupHandler(timeDifferenceMs)
  }
  
  func sendOrderForPickup(_ order: Order, onOrderPickedUp orderPickupHandler: (TimeIntervalMilliseconds) -> Void) {
    let timePoint = uptimeTracker.currentUptimeMilliseconds()
    lock.lock()
    defer {
      lock.unlock()
    }
    guard let courierData = courierDictionary[order.id] else {
      orderDictionary[order.id] = OrderData(order: order, preparationTimePoint: timePoint)
      return
    }
    let timeDifferenceMs = timePoint.absoluteDifference(from: courierData.arrivalTimePoint)
    orderPickupHandler(timeDifferenceMs)
  }
}
