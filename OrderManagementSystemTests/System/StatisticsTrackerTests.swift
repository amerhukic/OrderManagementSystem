//
//  StatisticsTrackerTests.swift
//  OrderManagementSystemTests
//
//  Created by Amer Hukić on 30. 1. 2021..
//

import XCTest
@testable import OrderManagementSystem

class StatisticsTrackerTests: XCTestCase {
  var tracker: StatisticsTracker!
  
  override func setUp() {
    super.setUp()
    tracker = StatisticsTracker()
  }
  
  override func tearDown() {
    super.tearDown()
    tracker = nil
  }
  
  func testAllOrdersPickedUp() {
    tracker.log([.orderReceived, .orderReceived])
    XCTAssertFalse(tracker.areAllOrdersPickedUp)
    
    tracker.log([.orderPickedUp, .orderPickedUp])
    XCTAssertTrue(tracker.areAllOrdersPickedUp)
  }
  
  func testAverageOrderWaitTime() {
    tracker.log([.orderWaitTime(10),
                 .orderWaitTime(20),
                 .orderWaitTime(30)])
    XCTAssertEqual(tracker.getAverageOrderWaitTime(), 20)
  }
  
  func testAverageCourierWaitTime() {
    tracker.log([.courierWaitTime(10),
                 .courierWaitTime(20),
                 .courierWaitTime(60)])
    XCTAssertEqual(tracker.getAverageCourierWaitTime(), 30)
  }
  
  func testAverageWaitTimeCalculationForNoOrders() {
    XCTAssertEqual(tracker.getAverageOrderWaitTime(), nil)
    XCTAssertEqual(tracker.getAverageCourierWaitTime(), nil)
  }
}
