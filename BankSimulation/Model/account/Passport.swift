//
//  Passport.swift
//  BankSimulation
//
//  Created by Denis Beloshitskiy on 12/17/22.
//

import Foundation

struct Passport: Codable {
  var id: Int
  var issued_at: Date
  var issued_by: String
  var series: Int
  var number: Int
  var is_validated: Bool

  static let empty = Passport(
    id: 0,
    issued_at: .distantPast,
    issued_by: "",
    series: 0,
    number: 0,
    is_validated: false
  )
}
