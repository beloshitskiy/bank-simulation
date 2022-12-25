//
//  ApplicationFactory.swift
//  BankSimulation
//
//  Created by Denis Beloshitskiy on 12/25/22.
//

import Foundation

final class ApplicationFactory {
  var appState: AppState

  init(appState: AppState) {
    self.appState = appState
  }

  func makeNewApplication(
    for client: Client,
    where type: ApplicationType,
    with description: String = ""
  ) -> Int {
    var application = Application.empty

    if let last = appState.storage.applications.last {
      application.id = last.id + 1
    } else {
      application.id = 1
    }

    application.client = client.id
    application.personal_manager = client.personal_manager
    application.application_date = .now
    application.type = type
    application.result = .notStartedYet
    application.description = description

    appState.storage.applications.appendAndStore(application, appState: appState)

    return application.id
  }
}
