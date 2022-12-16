//
//  Transaction.swift
//  BankSimulation
//
//  Created by Denis Beloshitskiy on 12/17/22.
//

import Foundation

struct Transaction {
  let transaction_id: Int
  let sender_account: Account
  let receiver_account: Account
  let date: Date
  let amount: Double
  let type: TransactionType
  let status: TransactionStatus
  let description: String
}

enum TransactionType: String, CaseIterable {
  case ICA = "Inter-client accounts"
  case IC = "Inter-clients"
  case charity = "Charity"
}

enum TransactionStatus: String, CaseIterable {
  case confirmed = "Confirmed"
  case inProgress = "In progress"
  case declined = "Declined"
}
