//
//  BlurView.swift
//  BankSimulation
//
//  Created by Denis Beloshitskiy on 12/17/22.
//

import SwiftUI

struct BlurView: View {
  @EnvironmentObject var appState: AppState
  var body: some View {
    ZStack {
      TextField("Введите логин", text: $login)
      SecureField("Введите пароль", text: $password)
      
      
      Rectangle()
        .blur(radius: 20)
        .backgroundStyle(.opacity(1))
    }
  }
}

struct BlurView_Previews: PreviewProvider {
  static var previews: some View {
    BlurView()
      .environmentObject(AppState())
  }
}
