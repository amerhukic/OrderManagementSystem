//
//  MatchedCourierOrderPickupContainer.swift
//  OrderManagementSystem
//
//  Created by Amer Hukić on 31. 1. 2021.
//

import Foundation

/// Container for couriers/orders waiting for pickup based on matched strategy.
class MatchedCourierOrderPickupContainer: CourierOrderPickupContainer {
  private var orderDictionary = [String: OrderData]()
  private var courierDictionary = [String: CourierData]()
  
  
  /// Stores the courier data.
  /// - Parameter courierData: Courier data to be stored
  func storeCourierData(_ courierData: CourierData) {
    courierDictionary[courierData.courier.orderId] = courierData
  }
  
  /// Stores the order data.
  /// - Parameter orderData: Order data to be stored
  func storeOrderData(_ orderData: OrderData) {
    orderDictionary[orderData.order.id] = orderData
  }
  
  /// Removes and returns the stored courier data based on the order ID. Returns `nil` if the courier with the order ID doesn't exist.
  /// - Parameter order: The order for which the courier is retrieved.
  /// - Returns: Courier data
  func getCourierData(forOrder order: Order) -> CourierData? {
    return courierDictionary.removeValue(forKey: order.id)
  }
  
  /// Removes and returns the stored order data based on order ID of the courier. Returns `nil` if the order with the courier's order ID doesn't exist.
  /// - Parameter courier: The courier for which the data is retrieved.
  /// - Returns: Order data
  func getOrderData(forCourier courier: Courier) -> OrderData? {
    return orderDictionary.removeValue(forKey: courier.orderId)
  }
}
