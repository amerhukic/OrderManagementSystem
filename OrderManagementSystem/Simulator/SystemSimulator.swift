//
//  System.swift
//  OrderManagementSystem
//
//  Created by Amer Hukić on 17. 1. 2021..
//

import Foundation

class SystemSimulator {
  private var orderGeneratorIndex = 0
  
  // TODO: refactor try i ostalo pregledati 
  func startFIFOSystemSimulation() {
    print("Starting FIFO system simulation")
    orderGeneratorIndex = 0
    let fifoSystem = OrderManagmentSystem()
    let orderLoader = OrderLoader()
    let orders = (try? orderLoader.loadOrders(fromFileNamed: "dispatch_orders")) ?? []
    Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] in
      guard let self = self else { return }
      let ordersPerSecond = 50
      var counter = 0
      while self.orderGeneratorIndex < orders.count && counter < ordersPerSecond {
        fifoSystem.acceptOrder(orders[self.orderGeneratorIndex])
        self.orderGeneratorIndex += 1
        counter += 1
      }
      if self.orderGeneratorIndex >= orders.count {
        $0.invalidate()
        fifoSystem.stopAcceptingOrders()
      }
    }
  }
}
