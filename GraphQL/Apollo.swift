//
//  Apollo.swift
//  Apollo-one
//
//  Created by Nitanta Adhikari on 8/19/21.
//

import Foundation
import Apollo

class Apollo {
  static let shared = Apollo()
    
  let client: ApolloClient
    
  init() {
    client = ApolloClient(url: URL(string: "https://apollo-fullstack-tutorial.herokuapp.com")!)
  }
    
}
