//
//  UInt64+Utilities.swift
//  OrderManagementSystem
//
//  Created by Amer Hukić on 30. 1. 2021.
//

import Foundation

extension UInt64 {
  
  /// Absolute difference between the calling integer and specified number.
  /// - Parameter number: The number from which the absolute difference is calculated
  /// - Returns: The absolute difference
  func absoluteDifference(from number: UInt64) -> UInt64 {
    return self > number ? (self - number) : (number - self)
  }
}
