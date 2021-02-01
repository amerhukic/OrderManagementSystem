//
//  OrderManagementSystemTests.swift
//  OrderManagementSystemTests
//
//  Created by Amer Hukić on 1. 2. 2021..
//

import XCTest
@testable import OrderManagementSystem

class OrderManagementSystemTests: XCTestCase {
  func testOrderManagementSystem() throws {
    let printer = CachingPrinterMock()
    let system = OrderManagmentSystem(pickupStrategy: .fifo, printer: printer)
    
    let order = Order(id: "1", name: "Banana Split", prepTime: 0)
    let orders = Array(repeating: order, count: 10)
    orders.forEach {
      system.acceptOrder($0)
    }
    system.stopAcceptingOrders()
    
  }
}
