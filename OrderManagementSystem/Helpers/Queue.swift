//
//  Queue.swift
//  OrderManagementSystem
//
//  Created by Amer Hukić on 19. 1. 2021..
//

import Foundation

struct Queue<T> {
  private var elements: Array<T> = []
  private let queue = DispatchQueue(label: "concurrent.queue", attributes: .concurrent)
  
  mutating func push(_ value: T) {
    queue.sync(flags: .barrier) {
      elements.append(value)
    }
  }
  
  // TODO: complexity je On jer se radi o arrayu
  // treba implementirati pomocu linkane liste da bi se lakse brisao prvi element
  @discardableResult mutating func pop() -> T? {
    return queue.sync(flags: .barrier) {
      guard !elements.isEmpty else {
        print("EMPTY AFTER ALL")
        return nil
      }
      return elements.removeFirst()
    }
  }
  
  var isEmpty: Bool {
    return queue.sync() {
      elements.isEmpty
    }
  }
}
