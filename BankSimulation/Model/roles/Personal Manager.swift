//
//  Personal Manager.swift
//  BankSimulation
//
//  Created by Denis Beloshitskiy on 12/17/22.
//

import Foundation

struct PersonalManager {
  let personal_manager_id: Int

  var full_name: String
  var is_active: Bool
  var credentials: Credentials
  var office: Office
}
