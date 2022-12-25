//
//  Array+Postgres.swift
//  BankSimulation
//
//  Created by Denis Beloshitskiy on 12/25/22.
//

import Foundation

extension [Credentials] {
  mutating func appendAndStore(_ credentials: Credentials, appState: AppState) {
    append(credentials)
    """
    INSERT INTO credentials (login, password)
    VALUES ('\(credentials.login)', '\(credentials.password)');
    """.execute(appState: appState)
  }

  mutating func delete(credentials: Credentials, appState: AppState) {
    if let target = first(where: { $0.id == credentials.id }) {
      remove(at: target.id)
      """
      DELETE FROM credentials
      WHERE id = \(target.id);
      """.execute(appState: appState)
    }
  }
}

extension [Region] {
  mutating func appendAndStore(_ region: Region, appState: AppState) {
    append(region)
    """
    INSERT INTO regions (region_name)
    VALUES ('\(region.region_name)');
    """.execute(appState: appState)
  }

  mutating func delete(region: Region, appState: AppState) {
    if let target = first(where: { $0.id == region.id }) {
      remove(at: target.id)
      """
      DELETE FROM regions
      WHERE id = \(target.id);
      """.execute(appState: appState)
    }
  }
}

extension [City] {
  mutating func appendAndStore(_ city: City, appState: AppState) {
    append(city)
    """
    INSERT INTO cities (region, name, description)
    VALUES (\(city.region), '\(city.name)', '\(city.description)');
    """.execute(appState: appState)
  }

  mutating func delete(city: City, appState: AppState) {
    if let target = first(where: { $0.id == city.id }) {
      remove(at: target.id)
      """
      DELETE FROM cities
      WHERE id = \(target.id);
      """.execute(appState: appState)
    }
  }
}

extension [Office] {
  mutating func appendAndStore(_ office: Office, appState: AppState) {
    append(office)
    """
    INSERT INTO offices (city_id, address, description)
    VALUES (\(office.city_id), '\(office.address)', '\(office.description)');
    """.execute(appState: appState)
  }

  mutating func delete(office: Office, appState: AppState) {
    if let target = first(where: { $0.id == office.id }) {
      remove(at: target.id)
      """
      DELETE FROM offices
      WHERE id = \(target.id);
      """.execute(appState: appState)
    }
  }
}

extension [Admin] {
  mutating func appendAndStore(_ admin: Admin, appState: AppState) {
    append(admin)
    """
    INSERT INTO admin (full_name, credentials)
    VALUES ('\(admin.full_name)', \(admin.credentials));
    """.execute(appState: appState)
  }

  mutating func delete(admin: Admin, appState: AppState) {
    if let target = first(where: { $0.id == admin.id }) {
      remove(at: target.id)
      """
      DELETE FROM admin
      WHERE id = \(target.id);
      """.execute(appState: appState)
    }
  }
}

extension [PersonalManager] {
  mutating func appendAndStore(_ pm: PersonalManager, appState: AppState) {
    append(pm)
    """
    INSERT INTO personal_managers (full_name, is_active, credentials, office)
    VALUES ('\(pm.full_name)', \(pm.is_active), \(pm.credentials), \(pm.office));
    """.execute(appState: appState)
  }

  mutating func delete(pm: PersonalManager, appState: AppState) {
    if let target = first(where: { $0.id == pm.id }) {
      remove(at: target.id)
      """
      DELETE FROM personal_managers
      WHERE id = \(target.id);
      """.execute(appState: appState)
    }
  }
}

extension [Passport] {
  mutating func appendAndStore(_ passport: Passport, appState: AppState) {
    append(passport)
    """
    INSERT INTO passports (issued_at, issued_by, series, number, is_validated)
    VALUES ('\(passport.issued_at.postgresDate(in: .current))', '\(passport.issued_by)',
    \(passport.series), \(passport.number), \(passport.is_validated));
    """.execute(appState: appState)
  }

  mutating func delete(passport: Passport, appState: AppState) {
    if let target = first(where: { $0.id == passport.id }) {
      remove(at: target.id)
      """
      DELETE FROM passports
      WHERE id = \(target.id);
      """.execute(appState: appState)
    }
  }
}

extension [Client] {
  mutating func appendAndStore(_ client: Client, appState: AppState) {
    append(client)
    """
    INSERT INTO clients (address, birthday, full_name, is_active, passport, credentials, personal_manager)
    VALUES ('\(client.address)', '\(client.birthday.postgresDate(in: .current))', '\(
      client
        .full_name
    )',
    \(client.is_active), \(client.passport), \(client.credentials), \(client.personal_manager));
    """.execute(appState: appState)
  }

  mutating func delete(client: Client, appState: AppState) {
    if let target = first(where: { $0.id == client.id }) {
      remove(at: target.id)
      """
      DELETE FROM clients
      WHERE id = \(target.id);
      """.execute(appState: appState)
    }
  }
}

extension [Account] {
  mutating func appendAndStore(_ account: Account, appState: AppState) {
    append(account)
    """
    INSERT INTO accounts (client_id, name, balance, currency, interest_rate, open_date, status, type)
    VALUES (\(account.client_id), '\(account.name)', 0, '\(account.currency.rawValue)', \(
      account
        .interest_rate
    ),
    '\(Date.now.postgresDate(in: .current))', '\(account.status.rawValue)', '\(
      account.type
        .rawValue
    )');
    """.execute(appState: appState)
  }

  mutating func delete(account: Account, appState: AppState) {
    if let target = first(where: { $0.id == account.id }) {
      remove(at: target.id)
      """
      DELETE FROM accounts
      WHERE id = \(target.id);
      """.execute(appState: appState)
    }
  }
}

extension [Application] {
  mutating func appendAndStore(_ app: Application, appState: AppState) {
    append(app)
    """
    INSERT INTO applications (client, personal_manager, application_date, type, result, description)
    VALUES (\(app.client), \(app.personal_manager), '\(
      app.application_date
        .postgresDate(in: .current)
    )',
    '\(app.type.rawValue)', '\(app.result.rawValue)', '\(app.description)');
    """.execute(appState: appState)
  }

  mutating func delete(application: Application, appState: AppState) {
    if let target = first(where: { $0.id == application.id }) {
      remove(at: target.id)
      """
      DELETE FROM applications
      WHERE id = \(target.id);
      """.execute(appState: appState)
    }
  }
}

extension [Transaction] {
  mutating func appendAndStore(_ tr: Transaction, appState: AppState) {
    append(tr)
    """
    INSERT INTO transactions (sender_account, receiver_account, date, amount, type, status, description)
    VALUES (\(tr.sender_account), \(tr.receiver_account), '\(
      tr.date
        .postgresDate(in: .current)
    )', \(tr.amount),
    '\(tr.type.rawValue)', '\(tr.status.rawValue)', '\(tr.description)');
    """.execute(appState: appState)
  }

  mutating func delete(tr: Transaction, appState: AppState) {
    if let target = first(where: { $0.id == tr.id }) {
      remove(at: target.id)
      """
      DELETE FROM transactions
      WHERE id = \(target.id);
      """.execute(appState: appState)
    }
  }
}
