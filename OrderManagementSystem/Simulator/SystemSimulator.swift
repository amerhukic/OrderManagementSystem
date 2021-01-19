//
//  System.swift
//  OrderManagementSystem
//
//  Created by Amer Hukić on 17. 1. 2021..
//

import Foundation

class SystemSimulator {
  private var orderGeneratorIndex = 0
  
  func startFIFOSystemSimulation() {
    print("Starting FIFO system simulation")
    orderGeneratorIndex = 0
    let fifoSystem = FIFOSystem()
    let orderGenerator = OrderGenerator()
    let orders = orderGenerator.readOrdersFromFile(named: "dispatch_orders")
    Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] in
      guard let self = self else { return }
      guard self.orderGeneratorIndex < orders.count else {
        $0.invalidate()
        return
      }
      fifoSystem.appendOrder(orders[self.orderGeneratorIndex])
    }
  }
}