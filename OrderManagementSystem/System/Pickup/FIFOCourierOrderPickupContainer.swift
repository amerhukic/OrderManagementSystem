//
//  FIFOCourierOrderPickupContainer.swift
//  OrderManagementSystem
//
//  Created by Amer Hukić on 31. 1. 2021.
//

import Foundation

/// Container for couriers/orders waiting for pickup based on FIFO strategy.
class FIFOCourierOrderPickupContainer: CourierOrderPickupContainer {
  /// Queue for storing order data
  private var orderQueue = Queue<OrderData>()
  /// Queue for storing courier data
  private var courierQueue = Queue<CourierData>()
  
  /// Stores the courier data.
  /// - Parameter courierData: The courier data to be stored
  func storeCourierData(_ courierData: CourierData) {
    courierQueue.push(courierData)
  }
  
  /// Stores the order data.
  /// - Parameter orderData: The order data to be stored
  func storeOrderData(_ orderData: OrderData) {
    orderQueue.push(orderData)
  }
  
  
  /// Removes and returns the stored courier data in FIFO order. Returns `nil` if the courier storage is empty.
  /// - Parameter order: The order for which the courier is retrieved. Note: in FIFO strategy this parameter is ignored.
  /// - Returns: Courier data
  func getCourierData(forOrder order: Order) -> CourierData? {
    return courierQueue.pop()
  }
  
  /// Removes and returns the stored order data in FIFO order. Returns `nil` if the order storage is empty.
  /// - Parameter courier: The courier for which the data is retrieved. Note: in FIFO strategy this parameter is ignored.
  /// - Returns: Order data
  func getOrderData(forCourier courier: Courier) -> OrderData? {
    return orderQueue.pop()
  }
}
