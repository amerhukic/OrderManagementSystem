//
//  Array+Utilities.swift
//  OrderManagementSystem
//
//  Created by Amer Hukić on 31. 1. 2021.
//

import Foundation

extension Array where Element == UInt64 {
  
  /// The average value of all integers in the array or `nil` if it is empty.
  var average: UInt64? {
    if isEmpty {
      return nil
    }
    let sum = reduce(0, +)
    return sum / UInt64(count)
  }
}
