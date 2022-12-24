//
//  Transaction.swift
//  BankSimulation
//
//  Created by Denis Beloshitskiy on 12/17/22.
//

import Foundation

struct Transaction: Codable, Hashable {
  let transaction_id: Int
  let sender_account: Int
  let receiver_account: Int
  let date: Date
  let amount: Double
  let type: TransactionType
  let status: TransactionStatus
  let description: String
}

enum TransactionType: String, CaseIterable, Codable {
  case ICA = "Inter-client accounts"
  case IC = "Inter-clients"
  case charity = "Charity"

  var localized: String {
    switch self {
      case .ICA: return "Перевод себе"
      case .IC: return "Перевод"
      case .charity: return "Благотворительность"
    }
  }
}

enum TransactionStatus: String, CaseIterable, Codable {
  case confirmed = "Confirmed"
  case inProgress = "In progress"
  case declined = "Declined"

  var localized: String {
    switch self {
      case .confirmed: return "Подтвержден"
      case .inProgress: return "В процессе"
      case .declined: return "Отклонен"
    }
  }
}
