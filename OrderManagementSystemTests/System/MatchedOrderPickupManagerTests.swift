//
//  MatchedOrderPickupManagerTests.swift
//  OrderManagementSystemTests
//
//  Created by Amer Hukić on 30. 1. 2021..
//

import XCTest
@testable import OrderManagementSystem

class MatchedOrderPickupManagerTests: XCTestCase {
  func testOrderPickupHandlerNotCalledWhenNoCurrierIsWaiting() {
    let manager = MatchedOrderPickupManager()
    let order = Order(id: "1", name: "Banan split", prepTime: 1)
    
    manager.sendOrderForPickup(order) { _ in
      XCTFail()
    }
    
  }
  
  func testOrderPickupHandlerNotCalledWhenNoOrderIsWaiting() {
    let manager = MatchedOrderPickupManager()
    let courier = Courier(orderId: "1")
    
    manager.sendCourierForPickup(courier) { _ in
      XCTFail()
    }
  }
}
