//
//  MatchedCourierOrderContainerTests.swift
//  OrderManagementSystemTests
//
//  Created by Amer Hukić on 1. 2. 2021.
//

import XCTest
@testable import OrderManagementSystem

class MatchedCourierOrderContainerTests: XCTestCase {
  var container: MatchedCourierOrderPickupContainer!
  
  override func setUp() {
    super.setUp()
    container = MatchedCourierOrderPickupContainer()
  }
  
  func testGettingCourierDataReturnsNilWhenNoOrderMatches() {
    let order = Order(id: "1", name: "Banana Split", prepTime: 1)
    let courierData = container.getCourierData(forOrder: order)
    XCTAssertNil(courierData)
  }
  
  func testGettingOrderDataReturnsNilWhenNoCourierMatches() {
    let courier = Courier(orderId: "1")
    let orderData = container.getOrderData(forCourier: courier)
    XCTAssertNil(orderData)
  }
  
  func testOrderGetsStored() {
    let orderId = "1"
    let courier = Courier(orderId: orderId)
    let order = Order(id: orderId, name: "Banana Split", prepTime: 1)
    let preparationTimePoint: TimeIntervalMilliseconds = 0
    let orderData = OrderData(order: order, preparationTimePoint: preparationTimePoint)
    container.storeOrderData(orderData)
    let storedOrderData = container.getOrderData(forCourier: courier)
    
    XCTAssertNotNil(storedOrderData)
    XCTAssertEqual(storedOrderData?.order, order)
    XCTAssertEqual(storedOrderData?.preparationTimePoint, preparationTimePoint)
  }
  
  func testCourierDataGetsStored() {
    let orderId = "1"
    let order = Order(id: orderId, name: "Banana Split", prepTime: 1)
    let courier = Courier(orderId: orderId)
    let arrivalTimePoint: TimeIntervalMilliseconds = 0
    let courierData = CourierData(courier: courier, arrivalTimePoint: arrivalTimePoint)
    container.storeCourierData(courierData)
    let storedCourierData = container.getCourierData(forOrder: order)
   
    XCTAssertNotNil(storedCourierData)
    XCTAssertEqual(storedCourierData?.courier, courier)
    XCTAssertEqual(storedCourierData?.arrivalTimePoint, arrivalTimePoint)
  }
}

