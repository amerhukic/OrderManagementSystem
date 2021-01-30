//
//  OrderLoaderTests.swift
//  OrderManagementSystemTests
//
//  Created by Amer Hukić on 28. 1. 2021..
//

import XCTest
@testable import OrderManagementSystem

class OrderLoaderTests: XCTestCase {
  func testFileNotFoundError() {
    let loader = OrderLoader()
    let fileName = "non-existing-file"
    var thrownError: Error?

    XCTAssertThrowsError(try loader.loadOrders(fromFileNamed: fileName)) {
      thrownError = $0
    }
    XCTAssertTrue(thrownError is OrderLoader.Error)
    XCTAssertEqual(thrownError as? OrderLoader.Error, .fileNotFound(name: fileName))
  }

  func testFileDecodingFailedError() {
    let loader = OrderLoader()
    let fileName = "empty-file"
    let bundle = Bundle(for: type(of: self))
    var thrownError: Error?
    
    XCTAssertThrowsError(try loader.loadOrders(fromFileNamed: fileName, in: bundle)) {
      thrownError = $0
    }
    XCTAssertTrue(thrownError is OrderLoader.Error)
    XCTAssertEqual(thrownError as? OrderLoader.Error, .fileDecodingFailed(name: fileName, thrownError!))
  }
}
