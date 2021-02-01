//
//  Kitchen.swift
//  OrderManagementSystem
//
//  Created by Amer Hukić on 24. 1. 2021.
//

import Foundation

/// Data structure for preparing orders
struct Kitchen {
  /// The queue on which the caller is notified when the order is prepared
  private let queue: DispatchQueue

  /// Creates a new kitchen object
  /// - Parameter queue: The queue on which the caller is notified when the order is prepared
  init(queue: DispatchQueue = DispatchQueue(label: "kitchen.concurrent.queue", attributes: .concurrent)) {
    self.queue = queue
  }
  
  /// Starts order preparations. The order is prepared after the specified prep time.
  /// - Parameters:
  ///   - prepTime: The time after which the order is prepared
  ///   - onOrderPrepared: The callback called when the order is prepared
  func startPreparingOrder(prepTime: Int, onOrderPrepared: @escaping () -> Void) {
    queue.asyncAfter(deadline: .now() + Double(prepTime)) {
      onOrderPrepared()
    }
  }
}
