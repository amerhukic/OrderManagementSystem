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
  private let analytics: Analytics
  
  init() {
    self.orderQueue = .init()
    self.courierQueue = .init()
    self.analytics = .shared
  }

  func acceptOrder(_ order: Order) {
    analytics.log(.orderReceived)
    
    // dispatch courier
    let arrivalTime = Double(Int.random(in: 3...15))
    DispatchQueue.main.asyncAfter(deadline: .now() + arrivalTime) {
      if self.orderQueue.isEmpty {
        self.courierQueue.push(Courier(orderId: order.id))
      } else {
        self.orderQueue.pop()
        self.analytics.log(.orderPickedUp)
      }
    }
    analytics.log(.courierDispatched)

    // start order preparation
    DispatchQueue.main.asyncAfter(deadline: .now() + Double(order.prepTime)) {
      self.analytics.log(.orderPrepared)
      if self.courierQueue.isEmpty {
        self.orderQueue.push(order)
      } else {
        self.courierQueue.pop()
        self.analytics.log(.orderPickedUp)
      }
    }
  }
}
