//
//  FIFOCourierOrderPickupContainer.swift
//  OrderManagementSystem
//
//  Created by Amer Hukić on 31. 1. 2021.
//

import Foundation

class FIFOCourierOrderPickupContainer: CourierOrderPickupContainer {
  private var orderQueue = Queue<OrderData>()
  private var courierQueue = Queue<CourierData>()
  
  func storeCourierData(_ courierData: CourierData) {
    courierQueue.push(courierData)
  }
  
  func storeOrderData(_ orderData: OrderData) {
    orderQueue.push(orderData)
  }
  
  func getCourierData(forOrder order: Order) -> CourierData? {
    return courierQueue.pop()
  }
  
  func getOrderData(forCourier courier: Courier) -> OrderData? {
    return orderQueue.pop()
  }
}
