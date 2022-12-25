//
//  Client.swift
//  BankSimulation
//
//  Created by Denis Beloshitskiy on 12/17/22.
//

import Foundation
import PostgresClientKit

struct Client: Codable, Hashable {
  var id: Int

  var address: String
  var birthday: Date
  var full_name: String
  var is_active: Bool
  var passport: Int
  var credentials: Int
  var personal_manager: Int

  static let empty = Client(
    id: 0,
    address: "",
    birthday: .distantPast,
    full_name: "",
    is_active: false,
    passport: 0,
    credentials: 0,
    personal_manager: 0
  )
}
