//
//  Account.swift
//  BankSimulation
//
//  Created by Denis Beloshitskiy on 12/17/22.
//

import Foundation

struct Account: Codable {
  let account_id: Int
  let client_id: Int
  var name: String
  var balance: Double
  var currency: Currency
  var interest_rate: Double
  var open_date: Date
  var status: AccountStatus
  var type: AccountType
}

enum AccountStatus: String, CaseIterable, Codable {
  case active = "Active"
  case onValidation = "On validation"
  case frozen = "Frozen"
  case inactive = "Inactive"
}

enum AccountType: String, CaseIterable, Codable {
  case regular = "Regular"
  case deposit = "Deposit"
  case charity = "Charity"
}

enum Currency: String, CaseIterable, Codable {
  case RUB = "Russian ruble"
  case USD = "US Dollar"
  case EUR = "Euro"
  case CHF = "Swiss frank"
}
