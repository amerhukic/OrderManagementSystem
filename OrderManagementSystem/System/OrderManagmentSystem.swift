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
  private var statisticsTracker = StatisticsTracker()
  private var shouldPrintStatistics = false
  private let orderPickupManager: OrderPickupManager
  private let printer: Printer
  private var statisticsCalculationCompletion: (() -> Void)?

  init(pickupStrategy: PickupStrategy, printer: Printer = ConsolePrinter()) {
    var container: CourierOrderPickupContainer
    switch pickupStrategy {
    case .fifo:
      container = FIFOCourierOrderPickupContainer()
    case .matched:
      container = MatchedCourierOrderPickupContainer()
    }
    orderPickupManager = OrderPickupManager(container: container)
    self.printer = printer
  }

  func acceptOrder(_ order: Order) {
    printAndLog(.orderReceived)
    dispatchCourier(for: order.id)
    startPreparing(order)
  }
  
  func calculateAverageWaitTimeStatistics(completion: (() -> Void)? = nil) {
    statisticsCalculationCompletion = completion
    shouldPrintStatistics = true
    printStatisticsIfFinishedProcessing()
  }
}

private extension OrderManagmentSystem {
  func dispatchCourier(for orderId: String) {
    courierDispatcher.dispatchCourier() { [weak self] in
      self?.printAndLog(.courierArrived)
      self?.orderPickupManager.sendCourierForPickup(Courier(orderId: orderId), onOrderPickedUp: { orderWaitTime in
        self?.printAndLog(.orderPickedUp, .orderWaitTime(orderWaitTime))
        self?.printStatisticsIfFinishedProcessing()
      })
    }
    printAndLog(.courierDispatched)
  }
  
  func startPreparing(_ order: Order) {
    kitchen.startPreparingOrder(prepTime: order.prepTime) { [weak self] in
      self?.printAndLog(.orderPrepared)
      self?.orderPickupManager.sendOrderForPickup(order, onOrderPickedUp: { courierWaitTime in
        self?.printAndLog(.orderPickedUp, .courierWaitTime(courierWaitTime))
        self?.printStatisticsIfFinishedProcessing()
      })
    }
  }
  
  func printAndLog(_ events: Event...) {
    printer.print(events.map { $0.description })
    statisticsTracker.log(events)
  }
  
  func printStatisticsIfFinishedProcessing() {
    guard shouldPrintStatistics && statisticsTracker.areAllOrdersPickedUp else {
      return
    }
    
    let averageOrderWaitTime = statisticsTracker.getAverageOrderWaitTime() ?? 0
    printer.print(Event.averageOrderWaitTime(averageOrderWaitTime).description)
    let averageCourierWaitTime = statisticsTracker.getAverageCourierWaitTime() ?? 0
    printer.print(Event.averateCourierWaitTime(averageCourierWaitTime).description)
    
    statisticsCalculationCompletion?()
  }
}
