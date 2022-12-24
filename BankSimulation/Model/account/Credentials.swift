//
//  Credentials.swift
//  BankSimulation
//
//  Created by Denis Beloshitskiy on 12/17/22.
//

import Foundation

struct Credentials: Codable, Hashable {
  var credentials_id: Int
  var login: String
  var password: String

  static let empty = Credentials(credentials_id: 0, login: "", password: "")
}
