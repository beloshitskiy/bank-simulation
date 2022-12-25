import PostgresClientKit

extension String {
  func execute(appState: AppState) {
    guard let connection = appState.connection else { return }
    do {
      let statement = try connection.prepareStatement(text: self)
      defer { statement.close() }

      let cursor = try statement.execute()
      cursor.close()

    } catch {
      print(error)
    }
  }

  func executeWithReturn(appState: AppState) -> [PostgresValue] {
    guard let connection = appState.connection else { return [] }
    do {
      let statement = try connection.prepareStatement(text: self)
      defer { statement.close() }

      let cursor = try statement.execute()
      defer { cursor.close() }

      for row in cursor {
        return try row.get().columns
      }
    } catch {
      print(error)
    }
    return []
  }
}
