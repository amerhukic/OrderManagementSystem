//
//  DispatchTime+Utilities.swift
//  OrderManagementSystem
//
//  Created by Amer Hukić on 27. 1. 2021..
//

import Foundation

extension DispatchTime {
  var uptimeMilliseconds: TimeIntervalMilliseconds {
    uptimeNanoseconds / 1_000_000
  }
  
  func absoluteMillisecondsDifference(from dispatchTime: DispatchTime) -> TimeIntervalMilliseconds {
    return (max(uptimeMilliseconds, dispatchTime.uptimeMilliseconds) - min(uptimeMilliseconds, dispatchTime.uptimeMilliseconds))
  }
}
