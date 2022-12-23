//
//  Application.swift
//  BankSimulation
//
//  Created by Denis Beloshitskiy on 12/17/22.
//

import Foundation

struct Application: Codable {
  let application_id: Int
  let client: Int
  let personal_manager: Int
  let application_date: Date
  let type: ApplicationType
  let result: ApplicationResult
  let description: String
}

enum ApplicationType: String, CaseIterable, Codable {
  case online = "Online"
  case inOffice = "In office"
}

enum ApplicationResult: String, CaseIterable, Codable {
  case confirmed = "Confirmed"
  case inProgress = "In progress"
  case notStartedYet = "Not started yet"
  case declined = "Declined"
}
