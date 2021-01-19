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

    self.orderQueue.didPushHandler = { [weak self] in
      // ako je dostupan kurir u queue onda izbaci taj order i tog kurira jer smo uspjeli napraviti
      // FIFO STRATEGY
      print("Order prepared")
      guard let self = self else { return }
      if !self.courierQueue.isEmpty {
        self.courierQueue.pop()
        self.orderQueue.pop()
        print("Order picked up")
      }
    }
    
    self.courierQueue.didPushHandler = { [weak self] in
      // ako je dostupan order onda izbaci order i kurira jer smo uspjeli napraviti
      // FIFO STRATEGY
      print("Courier arrived.")
      guard let self = self else { return }
      if !self.orderQueue.isEmpty {
        self.orderQueue.pop()
        self.courierQueue.pop()
        print("Order picked up")
      }
    }
  }

  func appendOrder(_ order: Order) {
    print("Order received")
    let arrivalTime = Double(Int.random(in: 3...15))
    DispatchQueue.main.asyncAfter(deadline: .now() + arrivalTime) {
      self.courierQueue.push(Courier(orderId: order.id))
    }
    
    // start order preparation
    print("Courier dispatched")
    DispatchQueue.main.asyncAfter(deadline: .now() + Double(order.prepTime)) {
      self.orderQueue.push(order)
    }
  }
}
