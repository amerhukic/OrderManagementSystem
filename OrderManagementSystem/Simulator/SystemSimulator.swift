//
//  SystemSimulator.swift
//  OrderManagementSystem
//
//  Created by Amer Hukić on 17. 1. 2021..
//

import Foundation

// TODO: more refactoring
class SystemSimulator {
  private let printer = ConsolePrinter()
  private var orderIndex = 0
  private let fifoSystem = OrderManagmentSystem(pickupStrategy: .fifo)
  
  func startFIFOSystemSimulation() {
    printer.print("----------------------------------------------------------")
    printer.print("Starting FIFO strategy order management system simulation")
    printer.print("----------------------------------------------------------")
    let orderLoader = OrderLoader()
    var orders: [Order]
    let fileName = "dispatch_orders"
    do {
      orders = try orderLoader.loadOrders(fromFileNamed: fileName)
    } catch {
      printer.print("Unable to load orders from \(fileName). Error: \(error.localizedDescription)")
      return
    }
    orderIndex = 0
    Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] timer in
      guard let self = self else { return }
      let ordersPerSecond = 50
      var counter = 0
      while self.orderIndex < orders.count && counter < ordersPerSecond {
        self.fifoSystem.acceptOrder(orders[self.orderIndex])
        self.orderIndex += 1
        counter += 1
      }
      if self.orderIndex >= orders.count {
        timer.invalidate()
        self.fifoSystem.stopAcceptingOrders()
      }
    }
  }
}
