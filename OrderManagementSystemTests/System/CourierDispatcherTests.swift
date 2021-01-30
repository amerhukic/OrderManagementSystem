//
//  CourierDispatcherTests.swift
//  OrderManagementSystemTests
//
//  Created by Amer Hukić on 30. 1. 2021..
//

import XCTest
@testable import OrderManagementSystem

class CourierDispatcherTests: XCTestCase {
  func testCourierDispatch() {
    let dispatcher = CourierDispatcher()
    let expectation = self.expectation(description: #function)
    dispatcher.dispatchCourier(arrivalTime: 0.1) {
      expectation.fulfill()
    }
    waitForExpectations(timeout: 3)
  }
}
