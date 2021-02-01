//
//  EmptyCourierOrderPickupContainerMock.swift
//  OrderManagementSystemTests
//
//  Created by Amer Hukić on 31. 1. 2021..
//

@testable import OrderManagementSystem

class EmptyCourierOrderPickupContainerMock: CourierOrderPickupContainer {
  func storeCourierData(_ courierData: CourierData) {}
  
  func storeOrderData(_ orderData: OrderData) {}
  
  func getCourierData(forOrder order: Order) -> CourierData? {
    return nil
  }
  
  func getOrderData(forCourier courier: Courier) -> OrderData? {
    return nil
  }
}
