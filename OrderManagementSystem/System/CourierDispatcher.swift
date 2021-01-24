//
//  CourierDispatcher.swift
//  OrderManagementSystem
//
//  Created by Amer Hukić on 24. 1. 2021..
//

import Foundation

struct CourierDispatcher {
  private let courierDispatchQueue: DispatchQueue
  
  init() {
    self.courierDispatchQueue = DispatchQueue(label: "courier.dispatch.queue", attributes: .concurrent)
  }
  
  func dispatchCourier(forOrderId orderId: String, completion: @escaping () -> Void) {
    let arrivalTime = Double(Int.random(in: 3...15))
    courierDispatchQueue.asyncAfter(deadline: .now() + arrivalTime) {
      completion()
    }
  }
}
