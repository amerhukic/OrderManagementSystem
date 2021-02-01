//
//  Order.swift
//  OrderManagementSystem
//
//  Created by Amer Hukić on 17. 1. 2021.
//

/// Represents the order that has to be prepared and picked up
struct Order: Decodable, Equatable {
  /// Unique ID of the order
  let id: String
  /// Name of the order
  let name: String
  /// Time it takes to prepare the order
  let prepTime: Int
}
