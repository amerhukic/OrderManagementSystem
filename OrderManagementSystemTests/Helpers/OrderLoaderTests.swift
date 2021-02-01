//
//  OrderLoaderTests.swift
//  OrderManagementSystemTests
//
//  Created by Amer Hukić on 28. 1. 2021.
//

import XCTest
@testable import OrderManagementSystem

class OrderLoaderTests: XCTestCase {
  let loader = OrderLoader()
  
  func testFileNotFoundError() {
    let fileName = "non-existing-file"
    var thrownError: Error?

    XCTAssertThrowsError(try loader.loadOrders(fromFileNamed: fileName)) {
      thrownError = $0
    }
    XCTAssertTrue(thrownError is OrderLoader.Error)
    XCTAssertEqual(thrownError as? OrderLoader.Error, .fileNotFound(name: fileName))
  }

  func testFileDecodingFailedError() {
    let fileName = "empty-file"
    let bundle = Bundle(for: type(of: self))
    var thrownError: Error?
    
    XCTAssertThrowsError(try loader.loadOrders(fromFileNamed: fileName, in: bundle)) {
      thrownError = $0
    }
    XCTAssertTrue(thrownError is OrderLoader.Error)
    XCTAssertEqual(thrownError as? OrderLoader.Error, .fileDecodingFailed(name: fileName, thrownError!))
  }
  
  func testLoadOrdersSucceeds() throws {
    let fileName = "orders"
    let bundle = Bundle(for: type(of: self))
    let orders = try loader.loadOrders(fromFileNamed: fileName, in: bundle)
    
    XCTAssertEqual(orders.count, 2)
    XCTAssertEqual(orders[0].id, "a8cfcb76-7f24-4420-a5ba-d46dd77bdffd")
    XCTAssertEqual(orders[0].name, "Banana Split")
    XCTAssertEqual(orders[0].prepTime, 4)
    
    XCTAssertEqual(orders[1].id, "58e9b5fe-3fde-4a27-8e98-682e58a4a65d")
    XCTAssertEqual(orders[1].name, "McFlury")
    XCTAssertEqual(orders[1].prepTime, 14)
  }
}
