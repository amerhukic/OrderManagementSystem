//
//  FIFOSystem.swift
//  OrderManagementSystem
//
//  Created by Amer Hukić on 19. 1. 2021..
//

import Foundation

// razlog zasto je System Class a ne struct: Escaping closure captures mutating 'self' parameter error u appendOrder
class FIFOSystem {
  private var orderQueue: Queue<Order>
  private var courierQueue: Queue<Courier>
  private let orderDispatchQueue: DispatchQueue
  private let courierDispatchQueue: DispatchQueue
  private let analytics: Analytics
  
  init() {
    self.orderQueue = .init()
    self.courierQueue = .init()
    self.analytics = .shared
    self.orderDispatchQueue = DispatchQueue(label: "order-dispatch-queue", attributes: .concurrent)
    self.courierDispatchQueue = DispatchQueue(label: "courier-dispatch-queue", attributes: .concurrent)
  }

  func acceptOrder(_ order: Order) {
    analytics.log(.orderReceived)
    dispatchCourier()
    startPreparing(order)
  }
}

private extension FIFOSystem {
  func dispatchCourier() {
    let arrivalTime = Double(Int.random(in: 3...15))
    courierDispatchQueue.asyncAfter(deadline: .now() + arrivalTime) {
      if self.orderQueue.isEmpty {
        self.courierQueue.push(Courier())
      } else {
        if self.orderQueue.pop() != nil {
          self.analytics.log(.orderPickedUp)
        } else {
          self.courierQueue.push(Courier())
        }
      }
    }
    analytics.log(.courierDispatched)
  }
  
  func startPreparing(_ order: Order) {
    orderDispatchQueue.asyncAfter(deadline: .now() + Double(order.prepTime)) {
      self.analytics.log(.orderPrepared)
      if self.courierQueue.isEmpty {
        self.orderQueue.push(order)
      } else {
        if self.courierQueue.pop() != nil {
          self.analytics.log(.orderPickedUp)
        } else {
          self.orderQueue.push(order)
        }
      }
    }
  }
}
