//
//  FIFOOrderPickupManager.swift
//  OrderManagementSystem
//
//  Created by Amer Hukić on 24. 1. 2021..
//

import Foundation

class FIFOOrderPickupManager {
  private var orderQueue = Queue<OrderData>()
  private var courierQueue = Queue<CourierData>()
  private let executionQueue = DispatchQueue(label: "OrderPickupManager.serial.dispatch.queue")
  
  func sendCourierForPickup(_ courier: Courier, onOrderPickedUp orderPickupHandler: @escaping (TimeIntervalMilliseconds) -> Void) {
    let now = DispatchTime.now()
    executionQueue.async {
      guard let orderData = self.orderQueue.pop() else {
        self.courierQueue.push(CourierData(courier: courier, arrivalTimePoint: now))
        return
      }
      let timeDifferenceMs = now.absoluteMillisecondsDifference(from: orderData.preparationTimePoint)
      orderPickupHandler(timeDifferenceMs)
    }
  }
  
  func sendOrderForPickup(_ order: Order, onOrderPickedUp orderPickupHandler: @escaping (TimeIntervalMilliseconds) -> Void) {
    let now = DispatchTime.now()
    executionQueue.async {
      guard let courierData = self.courierQueue.pop() else {
        self.orderQueue.push(OrderData(order: order, preparationTimePoint: now))
        return
      }
      let timeDifferenceMs = now.absoluteMillisecondsDifference(from: courierData.arrivalTimePoint)
      orderPickupHandler(timeDifferenceMs)
    }
  }
}
