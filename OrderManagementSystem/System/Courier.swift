//
//  Courier.swift
//  OrderManagementSystem
//
//  Created by Amer Hukić on 19. 1. 2021..
//

struct Courier: Decodable {
  let orderId: String?
  
  init(orderId: String? = nil) {
    self.orderId = orderId
  }
}
