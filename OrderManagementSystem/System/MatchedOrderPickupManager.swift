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
  private let executionQueue = DispatchQueue(label: "MatchedOrderPickupManager.serial.dispatch.queue")
  
  func sendCourierForPickup(_ courier: Courier, onOrderPickedUp orderPickupHandler: @escaping (TimeIntervalMilliseconds) -> Void) {
    let now = DispatchTime.now()
    executionQueue.async {
      guard let orderData = self.orderDictionary[courier.orderId] else {
        self.courierDictionary[courier.orderId] = CourierData(courier: courier, arrivalTimePoint: now)
        return
      }
      let timeDifferenceMs = now.absoluteMillisecondsDifference(from: orderData.preparationTimePoint)
      orderPickupHandler(timeDifferenceMs)
    }
  }
  
  func sendOrderForPickup(_ order: Order, onOrderPickedUp orderPickupHandler: @escaping (TimeIntervalMilliseconds) -> Void) {
    let now = DispatchTime.now()
    executionQueue.async {
      guard let courierData = self.courierDictionary[order.id] else {
        self.orderDictionary[order.id] = OrderData(order: order, preparationTimePoint: now)
        return
      }
      let timeDifferenceMs = now.absoluteMillisecondsDifference(from: courierData.arrivalTimePoint)
      orderPickupHandler(timeDifferenceMs)
    }
  }
}
