//
//  OrderPickupManagerTests.swift
//  OrderManagementSystemTests
//
//  Created by Amer Hukić on 30. 1. 2021.
//

import XCTest
@testable import OrderManagementSystem

class OrderPickupManagerTests: XCTestCase {
  func testOrderPickupHandlerNotCalledWhenNoCurrierIsWaiting() {
    let manager = OrderPickupManager(container: EmptyCourierOrderPickupContainerMock())
    let order = Order(id: "1", name: "Banan Split", prepTime: 1)
    
    manager.sendOrderForPickup(order) { _ in
      XCTFail()
    }
  }
  
  func testOrderPickupHandlerNotCalledWhenNoOrderIsWaiting() {
    let manager = OrderPickupManager(container: EmptyCourierOrderPickupContainerMock())
    let courier = Courier(orderId: "1")
    
    manager.sendCourierForPickup(courier) { _ in
      XCTFail()
    }
  }
  
  func testOrderPickupHandlerCalledWhenCourierArrivesAndOrderIsWaiting() {
    let manager = OrderPickupManager(container: CourierOrderPickupContainerMock(), uptimeTracker: UptimeTrackerMock())
    let courier = Courier(orderId: "1")
    var waitTime: TimeIntervalMilliseconds?
    
    manager.sendCourierForPickup(courier) { orderWaitTime in
      waitTime = orderWaitTime
    }
    XCTAssertEqual(waitTime, 0)
  }
  
  func testOrderPickupHandlerCalledWhenOrderArrivesAndCourierIsWaiting() {
    let manager = OrderPickupManager(container: CourierOrderPickupContainerMock(), uptimeTracker: UptimeTrackerMock())
    let order = Order(id: "1", name: "Banana Split", prepTime: 1)
    var waitTime: TimeIntervalMilliseconds?

    manager.sendOrderForPickup(order) { courierWaitTime in
      waitTime = courierWaitTime
    }
    XCTAssertEqual(waitTime, 0)
  }
}
