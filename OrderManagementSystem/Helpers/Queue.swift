//
//  Queue.swift
//  OrderManagementSystem
//
//  Created by Amer Hukić on 19. 1. 2021..
//

import Foundation

class Queue<T> {
  private var elements: Array<T> = []
  
  func push(_ value: T) {
    elements.append(value)
  }
  
  // TODO: complexity je On jer se radi o arrayu
  // 1. treba implementirati pomocu linkane liste da bi se lakse brisao prvi element
  // 2. provjeriti da li da vracam nil kad nema za pop??? ili ima neki bolji nacin
  // TODO: mora li biti ovo sync??? moze li biti async???
  func pop() -> T? {
    guard !elements.isEmpty else {
      return nil
    }
    return elements.removeFirst()
  }
}
