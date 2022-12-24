//
//  Storage.swift
//  BankSimulation
//
//  Created by Denis Beloshitskiy on 12/20/22.
//

import Foundation
import PostgresClientKit

final class Storage {
  // MARK: - Public interface
  
  static let `default` = Storage()

  var clients = [Client]()
  var managers = [PersonalManager]()
  var admin = [Admin]()
  
  var credentials = Set<Credentials>()

  var accounts = [Account]()
  var applications = [Application]()
  var transactions = [Transaction]()

  var offices = [Office]()
  var cities = [City]()
  var regions = [Region]()

  // MARK: - loading data

//  weak var appState: AppState?

  func loadData(with connection: Connection?) {
    guard let connection = connection else { return }

    do {
      // clients
      let clientsText = "SELECT * FROM clients;"
      let clientsStatement = try connection.prepareStatement(text: clientsText)
      defer { clientsStatement.close() }
      
      let clientsCursor = try clientsStatement.execute(retrieveColumnMetadata: true)
      defer { clientsCursor.close() }
      
      for row in clientsCursor {
        clients.append(try row.get().decodeByColumnName(Client.self))
      }
      
      
      // managers
      let managersText = "SELECT * FROM personal_managers;"
      let managersStatement = try connection.prepareStatement(text: managersText)
      defer { managersStatement.close() }
      
      let managersCursor = try managersStatement.execute(retrieveColumnMetadata: true)
      defer { managersCursor.close() }
      
      for row in managersCursor {
        managers.append(try row.get().decodeByColumnName(PersonalManager.self))
      }
      
      // admin
      let adminText = "SELECT * FROM admin;"
      let adminStatement = try connection.prepareStatement(text: adminText)
      defer { adminStatement.close() }
      
      let adminCursor = try adminStatement.execute(retrieveColumnMetadata: true)
      defer { adminCursor.close() }
      
      for row in adminCursor {
        admin.append(try row.get().decodeByColumnName(Admin.self))
      }
      
      // credentials
      let credentialsText = "SELECT * FROM credentials;"
      let credentialsStatement = try connection.prepareStatement(text: credentialsText)
      defer { credentialsStatement.close() }
      
      let credentialsCursor = try credentialsStatement.execute(retrieveColumnMetadata: true)
      defer { credentialsCursor.close() }
      
      for row in credentialsCursor {
        credentials.insert(try row.get().decodeByColumnName(Credentials.self))
      }
      
      // accounts
      let accountsText = "SELECT * FROM accounts;"
      let accountsStatement = try connection.prepareStatement(text: accountsText)
      defer { accountsStatement.close() }
      
      let accountsCursor = try accountsStatement.execute(retrieveColumnMetadata: true)
      defer { accountsCursor.close() }
      
      for row in accountsCursor {
        accounts.append(try row.get().decodeByColumnName(Account.self))
      }
      
      
      // applications
      let applicationsText = "SELECT * FROM applications;"
      let applicationsStatement = try connection.prepareStatement(text: applicationsText)
      defer { applicationsStatement.close() }
      
      let applicationsCursor = try applicationsStatement.execute(retrieveColumnMetadata: true)
      defer { applicationsCursor.close() }
      
      for row in applicationsCursor {
        applications.append(try row.get().decodeByColumnName(Application.self))
      }
      
      
      // transactions
      let transactionsText = "SELECT * FROM transactions;"
      let transactionsStatement = try connection.prepareStatement(text: transactionsText)
      defer { transactionsStatement.close() }
      
      let transactionsCursor = try transactionsStatement.execute(retrieveColumnMetadata: true)
      defer { transactionsCursor.close() }
      
      for row in transactionsCursor {
        transactions.append(try row.get().decodeByColumnName(Transaction.self))
      }
      
      
      // offices
      let officesText = "SELECT * FROM offices;"
      let officesStatement = try connection.prepareStatement(text: officesText)
      defer { officesStatement.close() }
      
      let officesCursor = try officesStatement.execute(retrieveColumnMetadata: true)
      defer { officesCursor.close() }
      
      for row in officesCursor {
        offices.append(try row.get().decodeByColumnName(Office.self))
      }
      
      
      // cities
      let citiesText = "SELECT * FROM cities;"
      let citiesStatement = try connection.prepareStatement(text: citiesText)
      defer { citiesStatement.close() }
      
      let citiesCursor = try citiesStatement.execute(retrieveColumnMetadata: true)
      defer { citiesCursor.close() }
      
      for row in citiesCursor {
        cities.append(try row.get().decodeByColumnName(City.self))
      }
      
      
      // regions
      let regionsText = "SELECT * FROM regions;"
      let regionsStatement = try connection.prepareStatement(text: regionsText)
      defer { regionsStatement.close() }
      
      let regionsCursor = try regionsStatement.execute(retrieveColumnMetadata: true)
      defer { regionsCursor.close() }
      
      for row in regionsCursor {
        regions.append(try row.get().decodeByColumnName(Region.self))
      }
    }
    catch {
      print(error)
    }
  }
}
