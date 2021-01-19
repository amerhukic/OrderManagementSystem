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
  var didPopHandler: (() -> Void)?

  mutating func push(_ value: T) {
    elements.append(value)
    didPushHandler?()
  }
  
  // TODO: complexity je On jer se radi o arrayu
  // treba implementirati pomocu linkane liste da bi se lakse brisao prvi element
  @discardableResult mutating func pop() -> T {
    let element = elements.removeFirst()
    didPopHandler?()
    return element
  }
  
  var isEmpty: Bool {
    elements.isEmpty
  }
}


// TODO:
//TREBA DODATI NOTIFIER KAD SE DESI PROMJENA U QUEUE:
//1. POMOCU DELEGETA
//2. POMOCU CLOSURA
//3. mozda preko property wrappera???
//I JEDAN I DRUGI NACIN BI TRAZILI DA SE RADI O KLASI A NE STRUCTU
