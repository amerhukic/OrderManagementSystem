//
//  OrderPickupManager.swift
//  OrderManagementSystem
//
//  Created by Amer Hukić on 26. 1. 2021.
//

import Foundation

/// Class for managing order pickups. Checks if there are available orders/couriers and matches them for delivery.
class OrderPickupManager {
  /// Container for storing and retrieving orders/couriers that are waiting
  private let container: CourierOrderPickupContainer
  /// Uptime tracker for tracking and calculating waiting time
  private let uptimeTracker: UptimeTracking
  /// Lock used for synchronization to avoid race conditions
  private let lock = NSLock()
  
  
  /// Creates a new order pickup manager object.
  /// - Parameters:
  ///   - container: Container for storing and retrieving orders/couriers that are waiting
  ///   - uptimeTracker: Uptime tracker for tracking and calculating waiting time
  init(container: CourierOrderPickupContainer,
       uptimeTracker: UptimeTracking = UptimeTracker()) {
    self.container = container
    self.uptimeTracker = uptimeTracker
  }
  
  /// Tries to match the courier with the order that he has to deliver. If the order doesn't exist the courier is put on a waiting list.
  /// - Parameters:
  ///   - courier: The courier that is to be matched with its order
  ///   - orderPickupHandler: Callback closure that is called when the courier has its match and the order is picked up
  func sendCourierForPickup(_ courier: Courier, onOrderPickedUp orderPickupHandler: (TimeIntervalMilliseconds) -> Void) {
    // We need to save the time point when the courier arrived before trying to get his order, because it can happen that the running thread waits for the lock and taking the time after it unlocks would give us a wrong value.
    let timePoint = uptimeTracker.currentUptimeMilliseconds()
    
    // We are using the lock to avoid race conditions where two threads could access the stored courier/order data at the same time and get an incorrect value, which could lead to the orderPickupHandler not being called.
    lock.lock()
    defer {
      lock.unlock()
    }
    guard let orderData = container.getOrderData(forCourier: courier) else {
      container.storeCourierData(CourierData(courier: courier, arrivalTimePoint: timePoint))
      return
    }
    let timeDifferenceMs = timePoint.absoluteDifference(from: orderData.preparationTimePoint)
    orderPickupHandler(timeDifferenceMs)
  }
  
  /// Tries to match the order with the courier that has to deliver it. If the courier doesn't exist the order is put on a waiting list.
  /// - Parameters:
  ///   - order: The order that is to be matched with its courier
  ///   - orderPickupHandler: Callback closure that is called when the order has its matching courier and the order is picked up
  func sendOrderForPickup(_ order: Order, onOrderPickedUp orderPickupHandler: (TimeIntervalMilliseconds) -> Void) {
    // We need to save the time point when the courier arrived before trying to get his order, because it can happen that the running thread waits for the lock and taking the time after it unlocks would give us a wrong value.
    let timePoint = uptimeTracker.currentUptimeMilliseconds()
    
    // We are using the lock to avoid race conditions where two threads could access the stored courier/order data at the same time and get an incorrect value, which could lead to the orderPickupHandler not being called.
    lock.lock()
    defer {
      lock.unlock()
    }
    guard let courierData = container.getCourierData(forOrder: order) else {
      container.storeOrderData(OrderData(order: order, preparationTimePoint: timePoint))
      return
    }
    let timeDifferenceMs = timePoint.absoluteDifference(from: courierData.arrivalTimePoint)
    orderPickupHandler(timeDifferenceMs)
  }
}
