//
//  Order.swift
//  OrderManagementSystem
//
//  Created by Amer Hukić on 17. 1. 2021..
//

struct Order: Decodable {
  let id: String
  let name: String
  let prepTime: Int
}
