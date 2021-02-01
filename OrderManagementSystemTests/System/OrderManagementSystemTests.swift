//
//  OrderManagementSystemTests.swift
//  OrderManagementSystemTests
//
//  Created by Amer Hukić on 1. 2. 2021..
//

import XCTest
@testable import OrderManagementSystem

class OrderManagementSystemTests: XCTestCase {
  func testFIFOOrderManagementSystem() throws {
    let printer = CachingPrinterMock()
    let system = OrderManagmentSystem(pickupStrategy: .fifo, printer: printer)
    
    let order = Order(id: "1", name: "Banana Split", prepTime: 0)
    let ordersCount = 10
    let orders = Array(repeating: order, count: ordersCount)
    orders.forEach {
      system.acceptOrder($0)
    }
    let expectation = self.expectation(description: #function)
    system.calculateAverageWaitTimeStatistics {
      expectation.fulfill()
    }
    waitForExpectations(timeout: 160)
    
    let orderReceivedEvents = printer.cachedLogs.filter { $0.contains(Event.orderReceived.description) }
    let orderPreparedEvents = printer.cachedLogs.filter { $0.contains(Event.orderPrepared.description) }
    let orderPickedUpEvents = printer.cachedLogs.filter { $0.contains(Event.orderPickedUp.description) }
    let courierDispatchedEvents = printer.cachedLogs.filter { $0.contains(Event.courierDispatched.description) }
    let courierArrivedEvents = printer.cachedLogs.filter { $0.contains(Event.courierArrived.description) }
    let orderWaitTimeEvents = printer.cachedLogs.filter { $0.contains("Food wait time") }
    let courierWaitTimeEvents = printer.cachedLogs.filter { $0.contains("Courier wait time") }
    let averageOrderWaitTimeEvent = printer.cachedLogs[printer.cachedLogs.count - 2]
    let averageCourierWaitTimeEvent = printer.cachedLogs[printer.cachedLogs.count - 1]

    XCTAssertEqual(orderReceivedEvents.count, ordersCount)
    XCTAssertEqual(orderPreparedEvents.count, ordersCount)
    XCTAssertEqual(orderPickedUpEvents.count, ordersCount)
    XCTAssertEqual(courierDispatchedEvents.count, ordersCount)
    XCTAssertEqual(courierArrivedEvents.count, ordersCount)
    XCTAssertEqual(orderWaitTimeEvents.count + courierWaitTimeEvents.count, ordersCount)
    XCTAssertTrue(averageOrderWaitTimeEvent.contains("Average order wait time"))
    XCTAssertTrue(averageCourierWaitTimeEvent.contains("Average courier wait time"))
  }
  
  func testMatchedOrderManagementSystem() throws {
    let printer = CachingPrinterMock()
    let system = OrderManagmentSystem(pickupStrategy: .matched, printer: printer)
    
    let ordersCount = 10
    let orders = (0..<ordersCount).map { Order(id: "\($0)", name: "Banana Split", prepTime: 0) }
    orders.forEach {
      system.acceptOrder($0)
    }
    let expectation = self.expectation(description: #function)
    system.calculateAverageWaitTimeStatistics {
      expectation.fulfill()
    }
    waitForExpectations(timeout: 160)
    
    let orderReceivedEvents = printer.cachedLogs.filter { $0.contains(Event.orderReceived.description) }
    let orderPreparedEvents = printer.cachedLogs.filter { $0.contains(Event.orderPrepared.description) }
    let orderPickedUpEvents = printer.cachedLogs.filter { $0.contains(Event.orderPickedUp.description) }
    let courierDispatchedEvents = printer.cachedLogs.filter { $0.contains(Event.courierDispatched.description) }
    let courierArrivedEvents = printer.cachedLogs.filter { $0.contains(Event.courierArrived.description) }
    let orderWaitTimeEvents = printer.cachedLogs.filter { $0.contains("Food wait time") }
    let courierWaitTimeEvents = printer.cachedLogs.filter { $0.contains("Courier wait time") }
    let averageOrderWaitTimeEvent = printer.cachedLogs[printer.cachedLogs.count - 2]
    let averageCourierWaitTimeEvent = printer.cachedLogs[printer.cachedLogs.count - 1]
    
    XCTAssertEqual(orderReceivedEvents.count, ordersCount)
    XCTAssertEqual(orderPreparedEvents.count, ordersCount)
    XCTAssertEqual(orderPickedUpEvents.count, ordersCount)
    XCTAssertEqual(courierDispatchedEvents.count, ordersCount)
    XCTAssertEqual(courierArrivedEvents.count, ordersCount)
    XCTAssertEqual(orderWaitTimeEvents.count + courierWaitTimeEvents.count, ordersCount)
    XCTAssertTrue(averageOrderWaitTimeEvent.contains("Average order wait time"))
    XCTAssertTrue(averageCourierWaitTimeEvent.contains("Average courier wait time"))
  }
}
