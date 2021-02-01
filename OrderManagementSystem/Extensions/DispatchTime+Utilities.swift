//
//  DispatchTime+Utilities.swift
//  OrderManagementSystem
//
//  Created by Amer Hukić on 27. 1. 2021.
//

import Foundation

extension DispatchTime {
  
  /// Returns the number of milliseconds since boot, excluding any time the system spent asleep.
  var uptimeMilliseconds: TimeIntervalMilliseconds {
    return uptimeNanoseconds / 1_000_000
  }
}
