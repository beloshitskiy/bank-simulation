//
//  Client.swift
//  BankSimulation
//
//  Created by Denis Beloshitskiy on 12/17/22.
//

import Foundation

struct Client {
  let client_id: Int

  var address: String
  var birthday: Date
  var full_name: String
  var is_active: Bool
  var passport: Passport
  var credentials: Credentials
  var personal_manager: PersonalManager
}
