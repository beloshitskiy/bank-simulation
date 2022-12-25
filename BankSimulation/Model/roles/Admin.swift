struct Admin: Codable, Hashable {
  var id: Int
  var full_name: String
  var credentials: Int

  static let empty = Admin(id: 0, full_name: "", credentials: 0)
}
