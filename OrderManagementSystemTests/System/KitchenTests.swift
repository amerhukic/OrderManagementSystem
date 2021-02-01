//
//  KitchenTests.swift
//  OrderManagementSystemTests
//
//  Created by Amer Hukić on 30. 1. 2021.
//

import XCTest
@testable import OrderManagementSystem

class KitchenTests: XCTestCase {
  func testOrderPDispatch() {
    let kitchen = Kitchen()
    let expectation = self.expectation(description: #function)
    kitchen.startPreparingOrder(prepTime: 1) {
      expectation.fulfill()
    }
    waitForExpectations(timeout: 3)
  }
}
