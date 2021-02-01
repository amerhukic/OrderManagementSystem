//
//  CourierOrderWaitingContainer.swift
//  OrderManagementSystem
//
//  Created by Amer Hukić on 31. 1. 2021..
//

import Foundation

protocol CourierOrderWaitingContainer {
  func storeCourierData(_ courierData: CourierData)
  func storeOrderData(_ orderData: OrderData)
  func getCourierData(forOrder order: Order) -> CourierData?
  func getOrderData(forCourier courier: Courier) -> OrderData?
}
