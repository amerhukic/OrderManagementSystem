//
//  PickupStrategy.swift
//  OrderManagementSystem
//
//  Created by Amer Hukić on 1. 2. 2021.
//

/// Strategy used for matching couriers with orders they need to pick up
enum PickupStrategy {
  /// First-in-first-out strategy where the first available available order is picked up by the first available courier uppon arrival
  case fifo
  /// Matched strategy where each courier has a unique order to pick up
  case matched
}
