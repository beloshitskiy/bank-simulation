import Foundation

struct Manager: Codable, Hashable {
  var id: Int
  var full_name: String
  var is_active: Bool
  var credentials: Int
  var office: Int
}
