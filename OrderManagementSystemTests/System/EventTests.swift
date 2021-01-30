//
//  EventTests.swift
//  OrderManagementSystemTests
//
//  Created by Amer Hukić on 30. 1. 2021..
//

import XCTest
@testable import OrderManagementSystem

class EventTests: XCTestCase {
  func testDescription() {
    let orderReceivedEvent = Event.orderReceived
    let orderPreparedEvent = Event.orderPrepared
    let courierDispatchedEvent = Event.courierDispatched
    let courierArrivedEvent = Event.courierArrived
    let orderPickedUpEvent = Event.orderPickedUp
    let orderWaitTimeEvent = Event.orderWaitTime(1)
    let courierWaitTimeEvent = Event.courierWaitTime(2)
    let averageOrderWaitTimeEvent = Event.averageOrderWaitTime(3)
    let averateCourierWaitTime = Event.averateCourierWaitTime(4)
    
    XCTAssertEqual(orderReceivedEvent.description, "Order received")
    XCTAssertEqual(orderPreparedEvent.description, "Order prepared")
    XCTAssertEqual(courierDispatchedEvent.description, "Courier dispatched")
    XCTAssertEqual(courierArrivedEvent.description, "Courier arrived")
    XCTAssertEqual(orderPickedUpEvent.description, "Order picked up")
    XCTAssertEqual(orderWaitTimeEvent.description, "Food wait time: 1 ms")
    XCTAssertEqual(courierWaitTimeEvent.description, "Courier wait time: 2 ms")
    XCTAssertEqual(averageOrderWaitTimeEvent.description, "Average order wait time: 3 ms")
    XCTAssertEqual(averateCourierWaitTime.description, "Average courier wait time: 4 ms")
  }
}
