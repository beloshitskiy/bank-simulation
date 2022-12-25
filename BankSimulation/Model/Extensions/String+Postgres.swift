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
}
