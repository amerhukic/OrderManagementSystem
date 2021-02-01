//
//  OrderTests.swift
//  OrderManagementSystemTests
//
//  Created by Amer Hukić on 30. 1. 2021.
//

import XCTest
@testable import OrderManagementSystem

class OrderTests: XCTestCase {
  func testDecoding() throws {
    let jsonString = """
    {
      "id": "a8cfcb76-7f24-4420-a5ba-d46dd77bdffd",
      "name": "Banana Split",
      "prepTime": 4
    }
    """
    let data = Data(jsonString.utf8)
    let decoder = JSONDecoder()
    let order = try decoder.decode(Order.self, from: data)
    
    XCTAssertEqual(order.id, "a8cfcb76-7f24-4420-a5ba-d46dd77bdffd")
    XCTAssertEqual(order.name, "Banana Split")
    XCTAssertEqual(order.prepTime, 4)
  }
}
