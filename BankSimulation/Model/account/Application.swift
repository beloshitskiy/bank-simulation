//
//  Application.swift
//  BankSimulation
//
//  Created by Denis Beloshitskiy on 12/17/22.
//

import Foundation

struct Application {
  let application_id: Int
  let client: Client
  let personal_manager: PersonalManager
  let application_date: Date
  let type: ApplicationType
  let result: ApplicationResult
  let description: String
}

enum ApplicationType: String, CaseIterable {
  case online = "Online"
  case inOffice = "In office"
}

enum ApplicationResult: String, CaseIterable {
  case confirmed = "Confirmed"
  case inProgress = "In progress"
  case notStartedYet = "Not started yet"
  case declined = "Declined"
}
