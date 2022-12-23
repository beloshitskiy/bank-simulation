//
//  Credentials.swift
//  BankSimulation
//
//  Created by Denis Beloshitskiy on 12/17/22.
//

import Foundation

struct Credentials: Codable {
  var credentials_id: Int
  var login: String
  var password: String

  static let `default` = Credentials(credentials_id: 0, login: "", password: "")
}
