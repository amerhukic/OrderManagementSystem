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
    let order = Order(id: "1", name: "Banan Split", prepTime: 1)
    
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
  
  func testOrderPickupHandlerNotCalledWhenCourierArrivesForDifferentOrder() {
    let manager = MatchedOrderPickupManager()
    let courier = Courier(orderId: "1")
    let order = Order(id: "2", name: "Banan Split", prepTime: 1)
    
    manager.sendOrderForPickup(order) { _ in }
    manager.sendCourierForPickup(courier) { _ in
      XCTFail()
    }
  }
  
  func testOrderPickupHandlerCalledWhenCourierArrivesAndOrderIsWaiting() {
    let manager = MatchedOrderPickupManager(uptimeTracker: UptimeTrackerMock())
    let courier = Courier(orderId: "1")
    let order = Order(id: "1", name: "Banana Split", prepTime: 10)
    var waitTime: TimeIntervalMilliseconds?
    
    manager.sendOrderForPickup(order) { _ in }
    manager.sendCourierForPickup(courier) { orderWaitTime in
      waitTime = orderWaitTime
    }
    XCTAssertEqual(waitTime, 0)
  }
  
  func testOrderPickupHandlerCalledWhenOrderArrivesAndCourierIsWaiting() {
    let manager = MatchedOrderPickupManager(uptimeTracker: UptimeTrackerMock())
    let courier = Courier(orderId: "1")
    let order = Order(id: "1", name: "Banana Split", prepTime: 10)
    var waitTime: TimeIntervalMilliseconds?

    manager.sendCourierForPickup(courier) { _ in }
    manager.sendOrderForPickup(order) { courierWaitTime in
      waitTime = courierWaitTime
    }
    XCTAssertEqual(waitTime, 0)
  }
}
