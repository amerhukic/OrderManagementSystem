//
//  FIFOSystem.swift
//  OrderManagementSystem
//
//  Created by Amer Hukić on 19. 1. 2021..
//

import Foundation

// razlog zasto je System Class a ne struct: Escaping closure captures mutating 'self' parameter error u appendOrder
class FIFOSystem {
  // mozda bi bilo dobro da wrappamo queue u posebnu klasu koja ce imati observere i delegate??
  private var orderQueue: Queue<Order>
  private var courierQueue: Queue<Courier>
  
  init() {
    self.orderQueue = .init()
    self.courierQueue = .init()
  }

  func acceptOrder(_ order: Order) {
    print("Order received")
    
    let arrivalTime = Double(Int.random(in: 3...15))
    DispatchQueue.main.asyncAfter(deadline: .now() + arrivalTime) {
      if self.orderQueue.isEmpty {
        self.courierQueue.push(Courier(orderId: order.id))
      } else {
        self.orderQueue.pop()
        print("Order picked up")
      }
    }
    print("Courier dispatched")

    // start order preparation
    DispatchQueue.main.asyncAfter(deadline: .now() + Double(order.prepTime)) {
      print("Order prepared")
      if self.courierQueue.isEmpty {
        self.orderQueue.push(order)
      } else {
        self.courierQueue.pop()
        print("Order picked up")
      }
    }
  }
}
