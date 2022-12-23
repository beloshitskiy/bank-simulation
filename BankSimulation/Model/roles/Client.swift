//
//  Client.swift
//  BankSimulation
//
//  Created by Denis Beloshitskiy on 12/17/22.
//

import Foundation
import PostgresClientKit

struct Client: Codable {
  let client_id: Int

  var address: String
  var birthday: Date?
  var full_name: String
  var is_active: Bool
  var passport: Int
  var credentials: Int
//  var personal_manager: PersonalManager
  var personal_manager: Int

//  init(
//    client_id: Int,
//    address: String,
//    birthday: Date,
//    full_name: String,
//    is_active: Bool,
//    passport: Passport,
//    credentials: Credentials,
//    personal_manager: Int
//  ) {
//    self.client_id = client_id
//    self.address = address
//    self.birthday = birthday
//    self.full_name = full_name
//    self.is_active = is_active
//    self.passport = passport
//    self.credentials = credentials
//    self.personal_manager = personal_manager
//  }
}
