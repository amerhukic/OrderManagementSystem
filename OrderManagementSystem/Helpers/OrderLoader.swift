//
//  OrderLoader.swift
//  OrderManagementSystem
//
//  Created by Amer Hukić on 17. 1. 2021..
//

import Foundation

struct OrderLoader {
  enum Error: Swift.Error {
    case fileNotFound(name: String)
    case fileDecodingFailed(name: String, Swift.Error)
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
