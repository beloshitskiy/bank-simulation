//
//  Personal Manager.swift
//  BankSimulation
//
//  Created by Denis Beloshitskiy on 12/17/22.
//

import Foundation

struct PersonalManager: Codable, Hashable {
  var id: Int

  var full_name: String
  var is_active: Bool
  var credentials: Int
  var office: Int
}
