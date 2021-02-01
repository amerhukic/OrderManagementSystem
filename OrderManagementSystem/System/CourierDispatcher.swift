//
//  CourierDispatcher.swift
//  OrderManagementSystem
//
//  Created by Amer Hukić on 24. 1. 2021.
//

import Foundation

/// Class for dispatching new couriers
struct CourierDispatcher {
  /// The queue on which the caller is notified when the courier arrives
  private let queue: DispatchQueue
  
  /// Creates a new courier dispatcher
  /// - Parameter queue: The queue on which the caller is notified when the courier arrives
  init(queue: DispatchQueue = DispatchQueue(label: "courier.dispatcher.concurrent.queue", attributes: .concurrent)) {
    self.queue = queue
  }
  
  /// Dispatches a new courier which arrives after the specified arrival time.
  /// - Parameters:
  ///   - arrivalTime: The time after which the courier arrives
  ///   - onCourierArrivedHandler: The callback called when the courier arrives
  func dispatchCourier(arrivalTime: Double = Double(Int.random(in: 3...15)),
                       onCourierArrivedHandler: @escaping () -> Void) {
    queue.asyncAfter(deadline: .now() + arrivalTime) {
      onCourierArrivedHandler()
    }
  }
}
