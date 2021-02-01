//
//  OrderPickupManager.swift
//  OrderManagementSystem
//
//  Created by Amer Hukić on 26. 1. 2021..
//

import Foundation

class OrderPickupManager {
  private let waitingContainer: CourierOrderWaitingContainer
  private let uptimeTracker: UptimeTracking
  private let lock = NSLock()
  
  init(waitingContainer: CourierOrderWaitingContainer,
       uptimeTracker: UptimeTracking = UptimeTracker()) {
    self.waitingContainer = waitingContainer
    self.uptimeTracker = uptimeTracker
  }
  
  func sendCourierForPickup(_ courier: Courier, onOrderPickedUp orderPickupHandler: (TimeIntervalMilliseconds) -> Void) {
    let timePoint = uptimeTracker.currentUptimeMilliseconds()
    lock.lock()
    defer {
      lock.unlock()
    }
    guard let orderData = waitingContainer.getOrderData(forCourier: courier) else {
      waitingContainer.storeCourierData(CourierData(courier: courier, arrivalTimePoint: timePoint))
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
    guard let courierData = waitingContainer.getCourierData(forOrder: order) else {
      waitingContainer.storeOrderData(OrderData(order: order, preparationTimePoint: timePoint))
      return
    }
    let timeDifferenceMs = timePoint.absoluteDifference(from: courierData.arrivalTimePoint)
    orderPickupHandler(timeDifferenceMs)
  }
}
