struct Region: Codable {
  var id: Int
  var region_name: String
}

struct City: Codable {
  var id: Int
  var region: Int
  var name: String
  var description: String
}

struct Office: Codable {
  var id: Int
  var city_id: Int
  var address: String
  var description: String
}
