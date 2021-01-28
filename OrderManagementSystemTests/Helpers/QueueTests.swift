//
//  QueueTests.swift
//  OrderManagementSystemTests
//
//  Created by Amer Hukić on 28. 1. 2021..
//

import XCTest
@testable import OrderManagementSystem

class QueueTests: XCTestCase {
  func testNewQueueIsEmpty() {
    let queue = Queue<Int>()
    XCTAssertTrue(queue.isEmpty)
  }
  
  func testPushAddsOneElement() {
    var queue = Queue<Int>()
    queue.push(90)
    XCTAssertFalse(queue.isEmpty)
    XCTAssertEqual(queue.count, 1)
  }
  
  func testPoppingEmptyQueueReturnsNil() {
    var queue = Queue<Int>()
    XCTAssertNil(queue.pop())
  }
  
  func testPoppingReturnsFirstValuePushed() {
    var queue = Queue<Int>()
    queue.push(1)
    queue.push(2)
    queue.push(3)
    XCTAssert(queue.pop() == 1)
  }
  
  func testPoppingRemovesFirstValuePushed() {
    var queue = Queue<Int>()
    queue.push(11)
    queue.push(22)
    queue.push(33)
    queue.pop()
    XCTAssertEqual(queue.count, 2)
  }
}
