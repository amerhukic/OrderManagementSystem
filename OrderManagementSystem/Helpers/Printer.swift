//
//  Printer.swift
//  OrderManagementSystem
//
//  Created by Amer Hukić on 1. 2. 2021.
//

import Foundation

/// Protocol for printing values
protocol Printer {
  func print(_ item: String)
  func print(_ items: [String])
}
