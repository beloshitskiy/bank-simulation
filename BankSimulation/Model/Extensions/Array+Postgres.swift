import Foundation

extension [Credentials] {
  mutating func appendAndStore(_ credentials: Credentials, appState: AppState) {
    append(credentials)
    """
    INSERT INTO credentials (login, password)
    VALUES ('\(credentials.login)', '\(credentials.password)');
    """.execute(appState: appState)
  }

  mutating func update(old: Credentials, with new: Credentials, appState: AppState) {
    guard let oldIndex = firstIndex(where: { $0.id == old.id }) else { return }
    appState.storage.credentials[oldIndex] = new

    delete(credentials: old, appState: appState)
    """
    INSERT INTO credentials (login, password)
    VALUES ('\(new.login)', '\(new.password)');
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

extension [Manager] {
  mutating func appendAndStore(_ pm: Manager, appState: AppState) {
    append(pm)
    """
    INSERT INTO personal_managers (full_name, is_active, credentials, office)
    VALUES ('\(pm.full_name)', \(pm.is_active), \(pm.credentials), \(pm.office));
    """.execute(appState: appState)
  }

  mutating func update(old: Manager, with new: Manager, appState: AppState) {
    guard let oldIndex = firstIndex(where: { $0.id == old.id }) else { return }
    appState.storage.managers[oldIndex] = new

    delete(pm: old, appState: appState)
    """
    INSERT INTO personal_managers (full_name, is_active, credentials, office)
    VALUES ('\(new.full_name)', \(new.is_active), \(new.credentials), \(new.office));
    """.execute(appState: appState)
  }

  mutating func delete(pm: Manager, appState: AppState) {
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

  mutating func update(old: Passport, with new: Passport, appState: AppState) {
    guard let oldIndex = firstIndex(where: { $0.id == old.id }) else { return }
    appState.storage.passports[oldIndex] = new

    delete(passport: old, appState: appState)
    """
    INSERT INTO passports (issued_at, issued_by, series, number, is_validated)
    VALUES ('\(new.issued_at.postgresDate(in: .current))', '\(new.issued_by)',
    \(new.series), \(new.number), \(new.is_validated));
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
    VALUES ('\(client.address)', '\(client.birthday.postgresDate(in: .current))',
    '\(client.full_name)', \(client.is_active), \(client.passport), \(client.credentials),
    \(client.personal_manager));
    """.execute(appState: appState)
  }

  mutating func update(old: Client, with new: Client, appState: AppState) {
    guard let oldIndex = firstIndex(where: { $0.id == old.id }) else { return }
    appState.storage.clients[oldIndex] = new

    delete(client: old, appState: appState)
    """
    INSERT INTO clients (address, birthday, full_name, is_active, passport, credentials, personal_manager)
    VALUES ('\(new.address)', '\(old.birthday.postgresDate(in: .current))',
    '\(new.full_name)', \(new.is_active), \(new.passport), \(new.credentials),
    \(new.personal_manager));
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
    VALUES (\(account.client_id), '\(account.name)', 0, '\(account.currency.rawValue)',
    \(account.interest_rate), '\(Date.now.postgresDate(in: .current))',
    '\(account.status.rawValue)', '\(account.type.rawValue)');
    """.execute(appState: appState)
  }

  mutating func update(old: Account, with new: Account, appState: AppState) {
    guard let oldIndex = firstIndex(where: { $0.id == old.id }) else { return }
    appState.storage.accounts[oldIndex] = new

    delete(account: old, appState: appState)
    """
    INSERT INTO accounts (client_id, name, balance, currency, interest_rate, open_date, status, type)
    VALUES (\(new.client_id), '\(new.name)', 0, '\(new.currency.rawValue)',
    \(new.interest_rate), '\(old.open_date)', '\(new.status.rawValue)',
    '\(new.type.rawValue)');
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
    VALUES (\(app.client), \(app.personal_manager),
    '\(app.application_date.postgresDate(in: .current))',
    '\(app.type.rawValue)', '\(app.result.rawValue)', '\(app.description)');
    """.execute(appState: appState)
  }

  mutating func update(old: Application, with new: Application, appState: AppState) {
    guard let oldIndex = firstIndex(where: { $0.id == old.id }) else { return }
    appState.storage.applications[oldIndex] = new

    delete(application: old, appState: appState)
    """
    INSERT INTO applications (client, personal_manager, application_date, type, result, description)
    VALUES (\(new.client), \(new.personal_manager),
    '\(old.application_date.postgresDate(in: .current))',
    '\(new.type.rawValue)', '\(new.result.rawValue)', '\(new.description)');
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
    VALUES (\(tr.sender_account), \(tr.receiver_account),
    '\(tr.date.postgresDate(in: .current))', \(tr.amount),
    '\(tr.type.rawValue)', '\(tr.status.rawValue)', '\(tr.description)');
    """.execute(appState: appState)
  }

  mutating func update(old: Transaction, with new: Transaction, appState: AppState) {
    guard let oldIndex = firstIndex(where: { $0.id == old.id }) else { return }
    appState.storage.transactions[oldIndex] = new

    delete(tr: old, appState: appState)
    """
    INSERT INTO transactions (sender_account, receiver_account, date, amount, type, status, description)
    VALUES (\(new.sender_account), \(new.receiver_account),
    '\(old.date.postgresDate(in: .current))', \(new.amount),
    '\(new.type.rawValue)', '\(new.status.rawValue)', '\(new.description)');
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
