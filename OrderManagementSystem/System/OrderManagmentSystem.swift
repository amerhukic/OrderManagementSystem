//
//  OrderManagmentSystem.swift
//  OrderManagementSystem
//
//  Created by Amer Hukić on 19. 1. 2021.
//

import Foundation

/// Order management system for preparing and delivering orders
class OrderManagmentSystem {
  /// Used for preparing orders
  private let kitchen = Kitchen()
  /// Used for dispatching couriers
  private let courierDispatcher = CourierDispatcher()
  /// Used for tracking wait time statistics
  private var statisticsTracker = StatisticsTracker()
  /// Used to indicate that the system has received all orders that it should print statistics
  private var shouldPrintStatistics = false
  /// Used for managing connection between orders and couriers
  private let orderPickupManager: OrderPickupManager
  /// Used for printing order/courier related events
  private let printer: Printer
  /// Completion block called after system finishes order deliveries and prints statistics
  private var statisticsCalculationCompletion: (() -> Void)?
  
  /// Initializes a new `OrderManagmentSystem` object
  /// - Parameters:
  ///   - pickupStrategy: Pickup strategy that defines how orders are picked up by couriers. Can be FIFO or matched.
  ///   - printer: Printer used for printing different events
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
  
  /// Accepts an order and sends it to preparation, and at the same time dispatches a courier to pick it up.
  /// - Parameter order: Order to be prepared and picked up
  func acceptOrder(_ order: Order) {
    printAndLog(.orderReceived)
    dispatchCourier(for: order.id)
    startPreparing(order)
  }
  
  /// Call this method to indicate to the system that it should print the average wait time statistics after all orders are prepared and picked up.
  /// - Parameter completion: Completion callback called after the statistics are calculated and printed
  func calculateAverageWaitTimeStatistics(completion: (() -> Void)? = nil) {
    statisticsCalculationCompletion = completion
    shouldPrintStatistics = true
    printStatisticsIfFinishedProcessing()
  }
}

private extension OrderManagmentSystem {
  /// Dispatches a new courier for picking up the order with the specified ID.
  /// - Parameter orderId: The ID of the order to be picked up
  func dispatchCourier(for orderId: String) {
    courierDispatcher.dispatchCourier { [weak self] in
      self?.printAndLog(.courierArrived)
      self?.orderPickupManager.sendCourierForPickup(Courier(orderId: orderId), onOrderPickedUp: { orderWaitTime in
        // We are printing the order picked up and wait time events together to make sure that they are printed  one after another in an atomic way
        self?.printAndLog(.orderPickedUp, .orderWaitTime(orderWaitTime))
        self?.printStatisticsIfFinishedProcessing()
      })
    }
    printAndLog(.courierDispatched)
  }
  
  /// Starts preparing the specified order.
  /// - Parameter order: The order to be prepared
  func startPreparing(_ order: Order) {
    kitchen.startPreparingOrder(prepTime: order.prepTime) { [weak self] in
      self?.printAndLog(.orderPrepared)
      self?.orderPickupManager.sendOrderForPickup(order, onOrderPickedUp: { courierWaitTime in
        self?.printAndLog(.orderPickedUp, .courierWaitTime(courierWaitTime))
        self?.printStatisticsIfFinishedProcessing()
      })
    }
  }
  
  /// Prints events and logs them in the statistics tracker.
  /// - Parameter events: Events to be printed and logged
  func printAndLog(_ events: Event...) {
    printer.print(events.map { $0.description })
    statisticsTracker.log(events)
  }
  
  /// Prints the average wait time statistics when all orders and picked up
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
