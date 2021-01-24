//
//  OrderGenerator.swift
//  OrderManagementSystem
//
//  Created by Amer Hukić on 17. 1. 2021..
//

import Foundation

struct OrderGenerator {
  
  // Mozda bi bilo najbolje implementirato extension na [Order] i tu napraviti read from file
  // A order generator koristiti za pravljenje novih ordera i dodavanje u queue
  
  func readOrdersFromFile(named fileName: String, bundle: Bundle = .main) -> [Order] {
    // TODO: Throw error when reading fails
    
    guard let url = bundle.url(forResource: fileName, withExtension: "json") else {
      return []
    }
    let data = try! Data(contentsOf: url)
    let decoder = JSONDecoder()
    return try! decoder.decode([Order].self, from: data)
  }
}
