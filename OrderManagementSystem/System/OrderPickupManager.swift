//
//  OrderPickupManager.swift
//  OrderManagementSystem
//
//  Created by Amer Hukić on 24. 1. 2021..
//

import Foundation

struct OrderPickupManager {
  private var orderQueue = Queue<OrderData>()
  private var courierQueue = Queue<CourierData>()
  private let timeCalculator = PickupTimeCalculator()
  private let executionQueue = DispatchQueue(label: "OrderPickupManager.serial.dispatch.queue")
  
  func courierArrived(_ courier: Courier, onOrderPickedUp orderPickupHandler: @escaping (UInt64) -> Void) {
    let now = DispatchTime.now()
    executionQueue.async {
      guard let orderData = orderQueue.pop() else {
        courierQueue.push(CourierData(courier: courier, arrivalTimePoint: now))
        return
      }
      let timeDifferenceMs = timeCalculator.getMillisecondTimeDifference(now, orderData.preparationTimePoint)
      orderPickupHandler(timeDifferenceMs)
    }
  }
  
  // TODO: better name - maybe handlePreparedOrder ?? or 
  func orderPrepared(_ order: Order, onOrderPickedUp orderPickupHandler: @escaping (UInt64) -> Void) {
    let now = DispatchTime.now()
    executionQueue.async {
      guard let courierData = courierQueue.pop() else {
        orderQueue.push(OrderData(order: order, preparationTimePoint: now))
        return
      }
      let timeDifferenceMs = timeCalculator.getMillisecondTimeDifference(now, courierData.arrivalTimePoint)
      orderPickupHandler(timeDifferenceMs)
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

extension DispatchTime {
  var uptimeMilliseconds: UInt64 {
    uptimeNanoseconds / 1_000_000
  }
}
