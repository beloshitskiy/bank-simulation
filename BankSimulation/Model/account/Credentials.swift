//
//  Credentials.swift
//  BankSimulation
//
//  Created by Denis Beloshitskiy on 12/17/22.
//

import Foundation

struct Credentials: Codable, Hashable {
  var id: Int
  var login: String
  var password: String

  static let empty = Credentials(id: 0, login: "", password: "")
}
