//
//  Queue.swift
//  OrderManagementSystem
//
//  Created by Amer Hukić on 19. 1. 2021.
//

import Foundation

/// Data structure used for storing values and retrieving values in FIFO order
struct Queue<T> {
  /// Array used for storing values
  private var array = [T?]()
  /// Value that represents the first index of a non-nil value in the array
  private var head = 0
  
  /// Boolean value that indicates if the queue is empty
  var isEmpty: Bool {
    return count == 0
  }
  
  /// Returns the number of elements in the queue
  var count: Int {
    return array.count - head
  }
  
  /// Adds a new element to the queue. It is a `O(1)` operation.
  /// - Parameter element: The element that is added
  mutating func push(_ element: T) {
    array.append(element)
  }
  
  /// Removes and returns the first element in the queue in FIFO order. Returns `nil` if the queue is empty. This is a `O(1)` operation on average.
  /// - Returns: The removed element
  @discardableResult mutating func pop() -> T? {
    // if head == array.count that means the queue is empty
    guard head < array.count, let element = array[head] else { return nil }
    
    // set the value to nil and move the head one position
    array[head] = nil
    head += 1
    
    // clear the allocated array memory after certain conditions are met
    let percentage = Double(head)/Double(array.count)
    if array.count > 50 && percentage > 0.25 {
      array.removeFirst(head)
      head = 0
    }
    
    return element
  }
}
