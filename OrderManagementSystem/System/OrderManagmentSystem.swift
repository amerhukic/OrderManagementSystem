//
//  OrderManagmentSystem.swift
//  OrderManagementSystem
//
//  Created by Amer Hukić on 19. 1. 2021..
//

import Foundation

// razlog zasto je System Class a ne struct: Escaping closure captures mutating 'self' parameter error u appendOrder
class OrderManagmentSystem {
  private let kitchen = Kitchen()
  private let courierDispatcher = CourierDispatcher()
  private let orderPickupManager = OrderPickupManager()
  private let printer = Printer()
  private var statistics: Statistics
  private var isAcceptingOrders = true

  init() {
    self.statistics = .init()
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
    courierDispatcher.dispatchCourier() {
      self.printAndLog(.courierArrived)
      self.orderPickupManager.courierArrived(Courier(orderId: orderId), onOrderPickedUp: {
        self.printAndLog(.orderPickedUp, .orderWaitTime($0))
        self.printFinalStatisticsIfPossible()
      })
    }
    printAndLog(.courierDispatched)
  }
  
  func startPreparing(_ order: Order) {
    kitchen.prepareOrder(order) {
      self.printAndLog(.orderPrepared)
      self.orderPickupManager.orderPrepared(order, onOrderPickedUp: {
        self.printAndLog(.orderPickedUp, .courierWaitTime($0))
        self.printFinalStatisticsIfPossible()
      })
    }
  }
  
  func printAndLog(_ events: Event...) {
    printer.print(events.map { $0.description })
    statistics.log(events)
  }
  
  func printFinalStatisticsIfPossible() {
    print("AMER: \(isAcceptingOrders) \(statistics.receivedOrdersCount) \(statistics.pickedUpOrdersCount)")
    guard !isAcceptingOrders && statistics.areAllOrdersPickedUp else {
      return
    }
    let averageOrderWaitTime = statistics.getAverageOrderWaitTime()
    let averageCourierWaitTime = statistics.getAverageCourierWaitTime()
    printer.print([Event.averageOrderWaitTime(averageOrderWaitTime).description,
                   Event.averateCourierWaitTime(averageCourierWaitTime).description])
  }
}
