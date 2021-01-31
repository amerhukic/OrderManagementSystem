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
  private let queue = DispatchQueue(label: "matched.order.pickup.manager.serial.queue")
  private let uptimeTracker: UptimeTracking
  
  init(uptimeTracker: UptimeTracking = UptimeTracker()) {
    self.uptimeTracker = uptimeTracker
  }
  
  func sendCourierForPickup(_ courier: Courier, onOrderPickedUp orderPickupHandler: @escaping (TimeIntervalMilliseconds) -> Void) {
    let timePoint = uptimeTracker.currentUptimeMilliseconds()
    queue.async { [weak self] in
      guard let orderData = self?.orderDictionary[courier.orderId] else {
        self?.courierDictionary[courier.orderId] = CourierData(courier: courier, arrivalTimePoint: timePoint)
        return
      }
      let timeDifferenceMs = timePoint.absoluteDifference(from: orderData.preparationTimePoint)
      orderPickupHandler(timeDifferenceMs)
    }
  }
  
  func sendOrderForPickup(_ order: Order, onOrderPickedUp orderPickupHandler: @escaping (TimeIntervalMilliseconds) -> Void) {
    let timePoint = uptimeTracker.currentUptimeMilliseconds()
    queue.async { [weak self] in
      guard let courierData = self?.courierDictionary[order.id] else {
        self?.orderDictionary[order.id] = OrderData(order: order, preparationTimePoint: timePoint)
        return
      }
      let timeDifferenceMs = timePoint.absoluteDifference(from: courierData.arrivalTimePoint)
      orderPickupHandler(timeDifferenceMs)
    }
  }
}
