//
//  Queue.swift
//  OrderManagementSystem
//
//  Created by Amer Hukić on 19. 1. 2021.
//

import Foundation

struct Queue<T> {
  private var array = [T?]()
  private var head = 0
  
  var isEmpty: Bool {
    return count == 0
  }
  
  var count: Int {
    return array.count - head
  }
  
  mutating func push(_ element: T) {
    array.append(element)
  }
  
  @discardableResult mutating func pop() -> T? {
    guard head < array.count, let element = array[head] else { return nil }
    
    array[head] = nil
    head += 1
    
    let percentage = Double(head)/Double(array.count)
    if array.count > 50 && percentage > 0.25 {
      array.removeFirst(head)
      head = 0
    }
    
    return element
  }
}
