//
//  UInt64+Utilities.swift
//  OrderManagementSystem
//
//  Created by Amer Hukić on 30. 1. 2021.
//

import Foundation

extension UInt64 {
  func absoluteDifference(from number: UInt64) -> TimeIntervalMilliseconds {
    self > number ? (self - number) : (number - self)
  }
}
