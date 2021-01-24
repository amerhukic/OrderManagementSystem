//
//  FIFOSystem.swift
//  OrderManagementSystem
//
//  Created by Amer Hukić on 19. 1. 2021..
//

import Foundation

// razlog zasto je System Class a ne struct: Escaping closure captures mutating 'self' parameter error u appendOrder
class FIFOSystem {
  private var orderQueue: ThreadSafeQueue<OrderData>
  private var courierQueue: ThreadSafeQueue<CourierData>
  private let orderDispatchQueue: DispatchQueue
  private let courierDispatchQueue: DispatchQueue
  private let logDispatchQueue = DispatchQueue(label: "logging.serial.queue")
  private var analytics: Analytics
  
  init() {
    self.orderQueue = .init()
    self.courierQueue = .init()
    self.analytics = .shared
    self.orderDispatchQueue = DispatchQueue(label: "order.dispatch.queue", attributes: .concurrent)
    self.courierDispatchQueue = DispatchQueue(label: "courier.dispatch.queue", attributes: .concurrent)
  }

  func acceptOrder(_ order: Order) {
    analytics.log(.orderReceived)
    dispatchCourier(for: order.id)
    startPreparing(order)
  }
}

private extension FIFOSystem {
  func dispatchCourier(for orderId: String) {
    let arrivalTime = Double(Int.random(in: 3...15))
    courierDispatchQueue.asyncAfter(deadline: .now() + arrivalTime) {
      self.analytics.log(.courierArrived(orderId: orderId))
      if self.orderQueue.isEmpty {
        self.courierQueue.push(CourierData(courier: Courier(), arrivalTimePoint: .now()))
      } else {
        
        if let orderData = self.orderQueue.pop() {
          let now = DispatchTime.now()
          self.logDispatchQueue.async {
            self.analytics.log(.orderPickedUp(orderId: orderId))
            print("AMER DIFFERENCE: \(getTimeDifference(orderData.preparationTimePoint.uptimeNanoseconds, now.uptimeNanoseconds)) ms")
          }
          
        } else {
          self.courierQueue.push(CourierData(courier: Courier(), arrivalTimePoint: .now()))
        }
      }
    }
    analytics.log(.courierDispatched(orderId: ""))
  }
  
  func startPreparing(_ order: Order) {
    orderDispatchQueue.asyncAfter(deadline: .now() + Double(order.prepTime)) {
      self.analytics.log(.orderPrepared(orderId: order.id))
      if self.courierQueue.isEmpty {
        self.orderQueue.push(OrderData(order: order, preparationTimePoint: .now()))
      } else {
        if let courierData = self.courierQueue.pop() {
          
          let now = DispatchTime.now()
          self.logDispatchQueue.async {
            self.analytics.log(.orderPickedUp(orderId: order.id))
            print("AMER DIFFERENCE: \(getTimeDifference(courierData.arrivalTimePoint.uptimeNanoseconds, now.uptimeNanoseconds)) ms")
          }
          
        } else {
          self.orderQueue.push(OrderData(order: order, preparationTimePoint: .now()))
        }
      }
    }
  }
}


func getTimeDifference(_ a: UInt64, _ b: UInt64) -> UInt64 {
  (max(a, b) - min(a, b)) / 1_000_000
}
