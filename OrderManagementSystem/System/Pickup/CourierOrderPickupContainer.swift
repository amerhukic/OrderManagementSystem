//
//  CourierOrderPickupContainer.swift
//  OrderManagementSystem
//
//  Created by Amer Hukić on 31. 1. 2021.
//

import Foundation

/// Protocol that defines storing and retrieving of orders and couriers that are waiting for pickup
protocol CourierOrderPickupContainer {
  func storeCourierData(_ courierData: CourierData)
  func storeOrderData(_ orderData: OrderData)
  func getCourierData(forOrder order: Order) -> CourierData?
  func getOrderData(forCourier courier: Courier) -> OrderData?
}
