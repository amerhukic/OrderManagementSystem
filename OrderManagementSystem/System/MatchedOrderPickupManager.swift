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
  private let timeCalculator = PickupTimeCalculator()
  private let executionQueue = DispatchQueue(label: "MatchedOrderPickupManager.serial.dispatch.queue")
  
  func courierArrived(_ courier: Courier, onOrderPickedUp orderPickupHandler: @escaping (UInt64) -> Void) {
    let now = DispatchTime.now()
    executionQueue.async {
      guard let orderData = self.orderDictionary[courier.orderId] else {
        self.courierDictionary[courier.orderId] = CourierData(courier: courier, arrivalTimePoint: now)
        return
      }
      let timeDifferenceMs = self.timeCalculator.getMillisecondTimeDifference(now, orderData.preparationTimePoint)
      orderPickupHandler(timeDifferenceMs)
    }
  }
  
  // TODO: better name - maybe handlePreparedOrder ?? or
  func orderPrepared(_ order: Order, onOrderPickedUp orderPickupHandler: @escaping (UInt64) -> Void) {
    let now = DispatchTime.now()
    executionQueue.async {
      guard let courierData = self.courierDictionary[order.id] else {
        self.orderDictionary[order.id] = OrderData(order: order, preparationTimePoint: now)
        return
      }
      let timeDifferenceMs = self.timeCalculator.getMillisecondTimeDifference(now, courierData.arrivalTimePoint)
      orderPickupHandler(timeDifferenceMs)
    }
  }
}
