//
//  OrderData.swift
//  OrderManagementSystem
//
//  Created by Amer Hukić on 24. 1. 2021.
//

import Foundation

/// Helper data structure for storing order's arrival time point
struct OrderData {
  let order: Order
  let preparationTimePoint: TimeIntervalMilliseconds
}
