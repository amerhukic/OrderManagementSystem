//
//  Queue.swift
//  OrderManagementSystem
//
//  Created by Amer Hukić on 19. 1. 2021..
//

import Foundation

struct Queue<T> {
  private var elements: Array<T> = []
  var didPushHandler: (() -> Void)?

  mutating func push(_ value: T) {
    elements.append(value)
    didPushHandler?()
  }
  
  // TODO: complexity je On jer se radi o arrayu
  // treba implementirati pomocu linkane liste da bi se lakse brisao prvi element
  @discardableResult mutating func pop() -> T {
    return elements.removeFirst()
  }
  
  var isEmpty: Bool {
    elements.isEmpty
  }
}
