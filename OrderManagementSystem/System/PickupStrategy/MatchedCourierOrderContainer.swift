//
//  MatchedCourierOrderContainer.swift
//  OrderManagementSystem
//
//  Created by Amer Hukić on 31. 1. 2021..
//

import Foundation

class MatchedCourierOrderContainer: CourierOrderWaitingContainer {
  private var orderDictionary = [String: OrderData]()
  private var courierDictionary = [String: CourierData]()
  
  func storeCourierData(_ courierData: CourierData) {
    courierDictionary[courierData.courier.orderId] = courierData
  }
  
  func storeOrderData(_ orderData: OrderData) {
    orderDictionary[orderData.order.id] = orderData
  }
  
  func getCourierData(forOrder order: Order) -> CourierData? {
    return courierDictionary[order.id]
  }
  
  func getOrderData(forCourier courier: Courier) -> OrderData? {
    return orderDictionary[courier.orderId]
  }
}
