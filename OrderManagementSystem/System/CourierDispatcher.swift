//
//  CourierDispatcher.swift
//  OrderManagementSystem
//
//  Created by Amer Hukić on 24. 1. 2021..
//

import Foundation

struct CourierDispatcher {
  private let queue: DispatchQueue
  
  init(queue: DispatchQueue = DispatchQueue(label: "courier.dispatcher.concurrent.queue", attributes: .concurrent)) {
    self.queue = queue
  }
  
  func dispatchCourier(arrivalTime: Double = Double(Int.random(in: 3...15)),
                       onCourierArrivedHandler: @escaping () -> Void) {
    queue.asyncAfter(deadline: .now() + arrivalTime) {
      onCourierArrivedHandler()
    }
  }
}
