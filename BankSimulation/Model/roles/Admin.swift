//
//  Admin.swift
//  BankSimulation
//
//  Created by Denis Beloshitskiy on 12/17/22.
//

import Foundation

struct Admin: Codable, Hashable {
  let admin_id: Int
  var full_name: String
  var credentials: String
}
