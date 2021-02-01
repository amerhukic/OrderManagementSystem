//
//  OrderManagmentSystem.swift
//  OrderManagementSystem
//
//  Created by Amer Hukić on 19. 1. 2021..
//

import Foundation

class OrderManagmentSystem {
  private let kitchen = Kitchen()
  private let courierDispatcher = CourierDispatcher()
  private let printer = Printer()
  private var statisticsTracker = StatisticsTracker()
  private var isAcceptingOrders = true
  private let orderPickupManager: OrderPickupManager

  init(pickupStrategy: PickupStrategy) {
    var container: CourierOrderWaitingContainer
    switch pickupStrategy {
    case .fifo:
      container = FIFOCourierOrderWaitingContainer()
    case .matched:
      container = MatchedCourierOrderWaitingContainer()
    }
    orderPickupManager = OrderPickupManager(waitingContainer: container)
  }

  func acceptOrder(_ order: Order) {
    printAndLog(.orderReceived)
    dispatchCourier(for: order.id)
    startPreparing(order)
  }
  
  func stopAcceptingOrders() {
    isAcceptingOrders = false
  }
}

private extension OrderManagmentSystem {
  func dispatchCourier(for orderId: String) {
    courierDispatcher.dispatchCourier() { [weak self] in
      self?.printAndLog(.courierArrived)
      self?.orderPickupManager.sendCourierForPickup(Courier(orderId: orderId), onOrderPickedUp: { orderWaitTime in
        self?.printAndLog(.orderPickedUp, .orderWaitTime(orderWaitTime))
        self?.printFinalStatisticsIfPossible()
      })
    }
    printAndLog(.courierDispatched)
  }
  
  func startPreparing(_ order: Order) {
    kitchen.startPreparingOrder(prepTime: order.prepTime) { [weak self] in
      self?.printAndLog(.orderPrepared)
      self?.orderPickupManager.sendOrderForPickup(order, onOrderPickedUp: { courierWaitTime in
        self?.printAndLog(.orderPickedUp, .courierWaitTime(courierWaitTime))
        self?.printFinalStatisticsIfPossible()
      })
    }
  }
  
  func printAndLog(_ events: Event...) {
    printer.print(events.map { $0.description })
    statisticsTracker.log(events)
  }
  
  func printFinalStatisticsIfPossible() {
    guard !isAcceptingOrders && statisticsTracker.areAllOrdersPickedUp else {
      return
    }
    
    if let averageOrderWaitTime = statisticsTracker.getAverageOrderWaitTime() {
      printer.print(Event.averageOrderWaitTime(averageOrderWaitTime).description)
    } else {
      printer.print("Unable to calculate average order wait time. No order was processed.")
    }
    
    if let averageCourierWaitTime = statisticsTracker.getAverageCourierWaitTime() {
      printer.print(Event.averateCourierWaitTime(averageCourierWaitTime).description)
    } else {
      printer.print("Unable to calculate average courier wait time. No order was processed.")
    }
  }
}
