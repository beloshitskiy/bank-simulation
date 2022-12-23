//
//  SidebarView.swift
//  BankSimulation
//
//  Created by Denis Beloshitskiy on 12/17/22.
//

import SwiftUI

struct SidebarView: View {
  @EnvironmentObject var appState: AppState

  var body: some View {
    List(selection: $appState.appMode) {
      Section {
        ForEach(AppMode.allCases, id: \.self) {
          Text($0.rawValue)
        }
      } header: {
        Text("Mode")
      }
    }
    .listStyle(.sidebar)
  }
}

struct SidebarView_Previews: PreviewProvider {
  static var previews: some View {
    SidebarView()
      .environmentObject(AppState())
      .preferredColorScheme(.dark)
      .frame(width: 200)
  }
}
