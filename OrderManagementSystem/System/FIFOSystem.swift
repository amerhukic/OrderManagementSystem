//
//  FIFOSystem.swift
//  OrderManagementSystem
//
//  Created by Amer Hukić on 19. 1. 2021..
//

import Foundation

// razlog zasto je System Class a ne struct: Escaping closure captures mutating 'self' parameter error u appendOrder
class FIFOSystem {
  private var analytics: Analytics
  private let kitchen = Kitchen()
  private let courierDispatcher = CourierDispatcher()
  private let orderPickupManager = OrderPickupManager()
  
  init() {
    self.analytics = .init()
  }

  func acceptOrder(_ order: Order) {
    analytics.log(.orderReceived)
    dispatchCourier(for: order.id)
    startPreparing(order)
  }
}

private extension FIFOSystem {
  func dispatchCourier(for orderId: String) {
    courierDispatcher.dispatchCourier(forOrderId: orderId) {
      self.analytics.log(.courierArrived)
      self.orderPickupManager.courierArrived(Courier(orderId: orderId)) {
        self.analytics.log(.orderWaitTime($0))
      }
    }
    analytics.log(.courierDispatched)
  }
  
  func startPreparing(_ order: Order) {
    kitchen.prepareOrder(order) {
      self.analytics.log(.orderPrepared)
      self.orderPickupManager.orderPrepared(order) {
        self.analytics.log(.courierWaitTime($0))
      }
    }
  }
}
