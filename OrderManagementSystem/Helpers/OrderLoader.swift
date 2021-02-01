//
//  OrderLoader.swift
//  OrderManagementSystem
//
//  Created by Amer Hukić on 17. 1. 2021.
//

import Foundation

struct OrderLoader {
  enum Error: Swift.Error, Equatable {
    case fileNotFound(name: String)
    case fileDecodingFailed(name: String, Swift.Error)
    
    static func == (lhs: OrderLoader.Error, rhs: OrderLoader.Error) -> Bool {
      switch (lhs, rhs) {
      case (.fileNotFound(let a), .fileNotFound(let b)) where a == b:
        return true
      case (.fileDecodingFailed(let a, _), .fileDecodingFailed(let b, _)) where a == b:
        return true
      default:
        return false
      }
    }
  }
  
  func loadOrders(fromFileNamed fileName: String, in bundle: Bundle = .main) throws -> [Order] {
    guard let url = bundle.url(forResource: fileName, withExtension: "json") else {
      throw Error.fileNotFound(name: fileName)
    }
    
    do {
      let data = try Data(contentsOf: url)
      let decoder = JSONDecoder()
      return try decoder.decode([Order].self, from: data)
    } catch {
      throw Error.fileDecodingFailed(name: fileName, error)
    }
  }
}
