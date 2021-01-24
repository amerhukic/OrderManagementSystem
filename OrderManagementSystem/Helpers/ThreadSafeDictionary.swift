//
//  ThreadSafeDictionary.swift
//  OrderManagementSystem
//
//  Created by Amer Hukić on 23. 1. 2021..
//

import Foundation

class ThreadSafeDictionary<KeyType: Hashable, ValueType> {
  typealias GenericDictionary = [KeyType: ValueType]
  private var container = GenericDictionary()
  private let dispatchQueue = DispatchQueue(label: "threadsafe.dictionary")

  subscript(key: KeyType) -> ValueType? {
    get {
      var value: ValueType?
      dispatchQueue.sync {
        value = container[key]
      }
      return value
    }
    set {
      dispatchQueue.async(flags: .barrier) {
        self.container[key] = newValue
      }
    }
  }
}
