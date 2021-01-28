//
//  Kitchen.swift
//  OrderManagementSystem
//
//  Created by Amer Hukić on 24. 1. 2021..
//

import Foundation

struct Kitchen {
  private let orderDispatchQueue: DispatchQueue

  init() {
    self.orderDispatchQueue = DispatchQueue(label: "kitchen.concurrent.queue", attributes: .concurrent)
  }
  
  func prepareOrder(_ order: Order, completion: @escaping () -> Void) {
    orderDispatchQueue.asyncAfter(deadline: .now() + Double(order.prepTime)) {
      completion()
    }
  }
}
