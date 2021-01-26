//
//  Printer.swift
//  OrderManagementSystem
//
//  Created by Amer Hukić on 25. 1. 2021..
//

import os.log
import Foundation

struct Printer {
  private let printDispatchQueue = DispatchQueue(label: "printing.serial.queue")
  private let logger = Logger()

  func print(_ items: [String]) {
    printDispatchQueue.async {
      items.forEach {
        self.logger.info("\($0)")
      }
    }
  }
}
