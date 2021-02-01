//
//  CachingPrinterMock.swift
//  OrderManagementSystem
//
//  Created by Amer Hukić on 1. 2. 2021.
//

import Foundation
@testable import OrderManagementSystem

class CachingPrinterMock: Printer {
  private let queue = DispatchQueue(label: "printer.serial.queue")
  var cachedLogs = [String]()
  
  func print(_ item: String) {
    print([item])
  }
  
  func print(_ items: [String]) {
    queue.async {
      self.cachedLogs.append(contentsOf: items)
    }
  }
}
