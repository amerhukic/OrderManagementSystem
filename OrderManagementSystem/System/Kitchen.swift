//
//  Kitchen.swift
//  OrderManagementSystem
//
//  Created by Amer Hukić on 24. 1. 2021..
//

import Foundation

struct Kitchen {
  private let queue: DispatchQueue

  init(queue: DispatchQueue = DispatchQueue(label: "kitchen.concurrent.queue", attributes: .concurrent)) {
    self.queue = queue
  }
  
  func startPreparingOrder(prepTime: Int, onOrderPrepared: @escaping () -> Void) {
    queue.asyncAfter(deadline: .now() + Double(prepTime)) {
      onOrderPrepared()
    }
  }
}
