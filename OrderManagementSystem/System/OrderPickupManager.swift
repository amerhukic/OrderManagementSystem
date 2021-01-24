//
//  OrderPickupManager.swift
//  OrderManagementSystem
//
//  Created by Amer Hukić on 24. 1. 2021..
//

import Foundation

struct OrderPickupManager {
  private var orderQueue = ThreadSafeQueue<OrderData>()
  private var courierQueue = ThreadSafeQueue<CourierData>()
  private let timeCalculator = PickupTimeCalculator()
  
  init() {
    
  }
  
  func courierArrived(_ courier: Courier, onOrderPickedUp orderPickupHandler: (UInt64) -> Void) {
    let now = DispatchTime.now()
    if self.orderQueue.isEmpty {
      self.courierQueue.push(CourierData(courier: courier, arrivalTimePoint: now))
    } else {
      if let orderData = self.orderQueue.pop() {
        let timeDifferenceMs = timeCalculator.getMillisecondTimeDifference(now, orderData.preparationTimePoint)
        orderPickupHandler(timeDifferenceMs)
      } else {
        self.courierQueue.push(CourierData(courier: courier, arrivalTimePoint: now))
      }
    }
  }
  
  func orderPrepared(_ order: Order, onOrderPickedUp orderPickupHandler: (UInt64) -> Void) {
    let now = DispatchTime.now()
    if self.courierQueue.isEmpty {
      self.orderQueue.push(OrderData(order: order, preparationTimePoint: now))
    } else {
      if let courierData = self.courierQueue.pop() {
        let timeDifferenceMs = timeCalculator.getMillisecondTimeDifference(now, courierData.arrivalTimePoint)
        orderPickupHandler(timeDifferenceMs)
      } else {
        self.orderQueue.push(OrderData(order: order, preparationTimePoint: now))
      }
    }
  }
}

struct PickupTimeCalculator {
  func getMillisecondTimeDifference(_ firstTime: DispatchTime, _ secondTime: DispatchTime) -> UInt64 {
    let firstTimeMs = firstTime.uptimeMilliseconds
    let secondTimeMs = secondTime.uptimeMilliseconds
    return (max(firstTimeMs, secondTimeMs) - min(firstTimeMs, secondTimeMs))
  }
}

private extension PickupTimeCalculator {
  func getTimeDifference(_ a: UInt64, _ b: UInt64) -> UInt64 {
    (max(a, b) - min(a, b)) / 1_000_000
  }
}

extension DispatchTime {
  var uptimeMilliseconds: UInt64 {
    uptimeNanoseconds / 1_000_000
  }
}
