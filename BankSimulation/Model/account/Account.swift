//
//  Account.swift
//  BankSimulation
//
//  Created by Denis Beloshitskiy on 12/17/22.
//

import Foundation

struct Account {
  let account_id: Int
  let client_id: Client
  var name: String
  var currency: Currency
  var interest_rate: Double
  var open_date: Date
  var status: AccountStatus
  var type: AccountType
}

enum AccountStatus: String, CaseIterable {
  case active = "Active"
  case onValidation = "On validation"
  case frozen = "Frozen"
  case inactive = "Inactive"
}

enum AccountType: String, CaseIterable {
  case regular = "Regular"
  case deposit = "Deposit"
  case charity = "Charity"
}

enum Currency: String, CaseIterable {
  case RUB = "Russian ruble"
  case USD = "US Dollar"
  case EUR = "Euro"
  case CHF = "Swiss frank"
}
