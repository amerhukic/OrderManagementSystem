//
//  ThreadSafeQueue.swift
//  OrderManagementSystem
//
//  Created by Amer Hukić on 19. 1. 2021..
//

import Foundation

// TODO: Preimenovati u ThreadSafeQueue?? provjeriti sta tacno znaci thread safe i da li to ima smisla
class ThreadSafeQueue<T> {
  private var elements: Array<T> = []
  private let queue = DispatchQueue(label: "threadsafe.queue", attributes: .concurrent)
  
  func push(_ value: T) {
    queue.async(flags: .barrier) {
      self.elements.append(value)
    }
  }
  
  // TODO: complexity je On jer se radi o arrayu
  // 1. treba implementirati pomocu linkane liste da bi se lakse brisao prvi element
  // 2. provjeriti da li da vracam nil kad nema za pop??? ili ima neki bolji nacin
  // TODO: mora li biti ovo sync??? moze li biti async???
  func pop() -> T? {
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
