//
//  LoginPageView.swift
//  BankSimulation
//
//  Created by Denis Beloshitskiy on 12/17/22.
//

import SwiftUI

struct LoginPageView: View {
  @EnvironmentObject var appState: AppState
  var body: some View {
    LoginView()
  }
}

struct LoginView: View {
  @State private var currentCredentials: Credentials = .default
  var body: some View {
    VStack {
      Text("Вход в ABC-банк")
        .font(.system(size: 28)).bold()
        .frame(width: 420, height: 30)
        .padding([.horizontal, .top])
      HStack {
        TextField("Логин", text: $currentCredentials.login)
          .font(.system(size: 15))
          .textFieldStyle(.roundedBorder)
          .frame(width: 255, height: 55)
        
        Button {
//          if performLogin(with: currentCredentials.login) {
//            
//          }
        } label: {
          Text("Продолжить")
            .font(.system(size: 15))
        }.frame(width: 160, height: 55)
      }
      .padding([.horizontal, .bottom])
    }
    .frame(width: 515, height: 200)
    .cornerRadius(24)
  }
}

struct PasswordView: View {
  var body: some View {
    Text("")
  }
}

struct LoginPageView_Previews: PreviewProvider {
  static var previews: some View {
    LoginPageView()
      .environmentObject(AppState())
  }
}
