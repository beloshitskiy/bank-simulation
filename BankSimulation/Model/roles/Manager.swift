struct Manager: Codable, Hashable {
  var id: Int
  var full_name: String
  var is_active: Bool
  var credentials: Int
  var office: Int

  static let empty = Manager(id: 0, full_name: "", is_active: false, credentials: 0, office: 0)
}
