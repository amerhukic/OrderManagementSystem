//
//  ConsolePrinter.swift
//  OrderManagementSystem
//
//  Created by Amer Hukić on 25. 1. 2021.
//

import os.log
import Foundation

struct ConsolePrinter: Printer {
  /// Dispatch queue for syncing console output when writing multiple items at once
  private let queue = DispatchQueue(label: "console.printer.serial.queue")
  /// Logger for logging console output
  private let logger = Logger()
  
  /// Prints the specified item to the console
  /// - Parameter item: The item to be printed
  func print(_ item: String) {
    print([item])
  }
  
  /// Prints the specified items to the console. This is a helper method that makes sure that printing of the items is atomic.
  /// - Parameter items: The items to be printed
  func print(_ items: [String]) {
    queue.async {
      items.forEach {
        self.logger.info("\($0)")
      }
    }
  }
}
