//
//  FIFOCourierOrderPickupContainer.swift
//  OrderManagementSystemTests
//
//  Created by Amer Hukić on 1. 2. 2021..
//

import XCTest
@testable import OrderManagementSystem

class FIFOCourierOrderContainerTests: XCTestCase {
  var container: FIFOCourierOrderPickupContainer!
  
  override func setUp() {
    super.setUp()
    container = FIFOCourierOrderPickupContainer()
  }
  
  func testGettingCourierDataReturnsNilWhenNoCourierIsAvailable() {
    let order = Order(id: "1", name: "Banana Split", prepTime: 1)
    let courierData = container.getCourierData(forOrder: order)
    XCTAssertNil(courierData)
  }
  
  func testGettingOrderDataReturnsNilWhenNoOrderIsAvailable() {
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
  
  func testGettingOrderDataReturnsFirstStoredOrderData() {
    let order = Order(id: "1", name: "Banana Split", prepTime: 1)
    let preparationTimePoint: TimeIntervalMilliseconds = 0
    let orderData = OrderData(order: order, preparationTimePoint: preparationTimePoint)
    container.storeOrderData(orderData)
    container.storeOrderData(OrderData(order: Order(id: "2", name: "Cake", prepTime: 1), preparationTimePoint: 2))
    let storedOrderData = container.getOrderData(forCourier: Courier(orderId: "50"))
    
    XCTAssertNotNil(storedOrderData)
    XCTAssertEqual(storedOrderData?.order, order)
    XCTAssertEqual(storedOrderData?.preparationTimePoint, preparationTimePoint)
  }
  
  func testGettingCourierDataReturnsFirstStoredCourierData() {
    let order = Order(id: "1", name: "Banana Split", prepTime: 1)
    let courier = Courier(orderId: "2")
    let arrivalTimePoint: TimeIntervalMilliseconds = 0
    let courierData = CourierData(courier: courier, arrivalTimePoint: arrivalTimePoint)
    container.storeCourierData(courierData)
    container.storeCourierData(CourierData(courier: Courier(orderId: "40"), arrivalTimePoint: 1))
    let storedCourierData = container.getCourierData(forOrder: order)
    
    XCTAssertNotNil(storedCourierData)
    XCTAssertEqual(storedCourierData?.courier, courier)
    XCTAssertEqual(storedCourierData?.arrivalTimePoint, arrivalTimePoint)
  }
}
