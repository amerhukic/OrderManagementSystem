//
//  SystemSimulator.swift
//  OrderManagementSystem
//
//  Created by Amer Hukić on 17. 1. 2021.
//

import Foundation

class SystemSimulator {
  private let printer = ConsolePrinter()
  private var system: OrderManagmentSystem?
  
  /// Starts the simulation of the order handling with the specified strategy. Each second 2 orders are sent to the system.
  /// - Parameters:
  ///   - strategy: The order pickup strategy used by the system
  ///   - completion: Completion callback called when the order processing completes
  func startSystemSimulation(withPickupStrategy strategy: PickupStrategy, completion: @escaping () -> Void) {
    printer.print("-------------------------------------------------------------------------")
    printer.print("Starting \(strategy.rawValue) strategy order management system simulation")
    printer.print("-------------------------------------------------------------------------")

    // Load orders form file
    let orderLoader = OrderLoader()
    var orders: [Order]
    let fileName = "dispatch_orders"
    do {
      orders = try orderLoader.loadOrders(fromFileNamed: fileName)
    } catch {
      printer.print("Unable to load orders from \(fileName). Error: \(error.localizedDescription)")
      return
    }
    
    // Create a system with specified pickup strategy
    system = OrderManagmentSystem(pickupStrategy: strategy)

    // Send 2 orders per second
    let ordersPerSecond = 2
    var orderIndex = 0
    Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] timer in
      guard let self = self else { return }
      var sentOrderCounter = 0
      while orderIndex < orders.count && sentOrderCounter < ordersPerSecond {
        self.system?.acceptOrder(orders[orderIndex])
        orderIndex += 1
        sentOrderCounter += 1
      }
      
      // If all orders are sent to the system - calculate the average wait time statistics
      if orderIndex >= orders.count {
        timer.invalidate()
        self.system?.calculateAverageWaitTimeStatistics(completion: completion)
      }
    }
  }
}
