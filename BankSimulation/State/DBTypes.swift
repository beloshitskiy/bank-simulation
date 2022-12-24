//
//  DBTypes.swift
//  BankSimulation
//
//  Created by Denis Beloshitskiy on 12/24/22.
//

import Foundation

enum DBTypes: String, CaseIterable {
  case clients
  case managers
  case admin
  
  case accounts
  case applications
  case transactions
  case offices
  case cities
  case regions
}
