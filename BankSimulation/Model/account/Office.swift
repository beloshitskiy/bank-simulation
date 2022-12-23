//
//  Region.swift
//  BankSimulation
//
//  Created by Denis Beloshitskiy on 12/17/22.
//

import Foundation

struct Region: Codable {
  var region_id: Int
  var region_name: String
}

struct City: Codable {
  var city_id: Int
  var region: Int
  var name: String
  var description: String
}

struct Office: Codable {
  var office_id: Int
  var city_id: Int
  var address: String
  var description: String
}
