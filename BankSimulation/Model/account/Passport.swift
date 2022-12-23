//
//  Passport.swift
//  BankSimulation
//
//  Created by Denis Beloshitskiy on 12/17/22.
//

import Foundation

struct Passport: Codable {
  let passport_id: Int
  let issued_at: Date
  let issued_by: String
  let series: Int
  let number: Int
  let is_validated: Bool
}
