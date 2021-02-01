//
//  CourierOrderPickupContainerMock.swift
//  OrderManagementSystemTests
//
//  Created by Amer Hukić on 1. 2. 2021..
//

@testable import OrderManagementSystem

class CourierOrderPickupContainerMock: CourierOrderPickupContainer {
  func storeCourierData(_ courierData: CourierData) {}
  
  func storeOrderData(_ orderData: OrderData) {}
  
  func getCourierData(forOrder order: Order) -> CourierData? {
    return CourierData(courier: Courier(orderId: "1"), arrivalTimePoint: 0)
  }
  
  func getOrderData(forCourier courier: Courier) -> OrderData? {
    return OrderData(order: Order(id: "1", name: "Banana Split", prepTime: 1), preparationTimePoint: 0)
  }
}
