//
//  Transaction.swift
//  BankSimulation
//
//  Created by Denis Beloshitskiy on 12/17/22.
//

import Foundation

struct Transaction: Codable {
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
}

enum TransactionStatus: String, CaseIterable, Codable {
  case confirmed = "Confirmed"
  case inProgress = "In progress"
  case declined = "Declined"
}
