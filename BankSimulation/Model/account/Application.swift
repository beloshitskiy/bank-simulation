//
//  Application.swift
//  BankSimulation
//
//  Created by Denis Beloshitskiy on 12/17/22.
//

import Foundation

struct Application: Codable {
  var application_id: Int
  var client: Int
  var personal_manager: Int
  var application_date: Date
  var type: ApplicationType
  var result: ApplicationResult
  var description: String
}

enum ApplicationType: String, CaseIterable, Codable {
  case online = "Online"
  case inOffice = "In office"

  var localized: String {
    switch self {
      case .online: return "Онлайн"
      case .inOffice: return "В офисе"
    }
  }
}

enum ApplicationResult: String, CaseIterable, Codable {
  case confirmed = "Confirmed"
  case inProgress = "In progress"
  case notStartedYet = "Not started yet"
  case declined = "Declined"

  var localized: String {
    switch self {
      case .confirmed: return "Подвержден"
      case .inProgress: return "В процессе"
      case .notStartedYet: return "На рассмотрении"
      case .declined: return "Отклонен"
    }
  }
}
