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
    let model = LoginPageViewModel(appState: appState)
    return LoginView(model: model)
  }
}

struct LoginView: View {
  @State private var currentCredentials: Credentials = .empty
  @State private var login = "Lang"
  @State private var password = "VNB43JLX5MR"
  @State private var isAlertHidden = false
  @State var model: LoginPageViewModel
  @State private var curPage = Page.loginPage
  @State private var buttonHidden = false
  var body: some View {
    VStack {
      Text("Вход в ABC-банк")
        .font(.system(size: 28)).bold()
        .frame(width: 420, height: 30)
        .padding([.horizontal, .top])
      HStack {
        VStack(spacing: 10) {
          TextField("Логин", text: $currentCredentials.login)
            .font(.system(size: 15))
            .textFieldStyle(.roundedBorder)

          SecureField("Пароль", text: $currentCredentials.password)
            .font(.system(size: 15))
            .textFieldStyle(.roundedBorder)
            
        }.padding()

        ZStack {
          Button {
            currentCredentials.login = login
            currentCredentials.password = password
            
            if let client = model.performClientLogin(with: currentCredentials) {
              curPage = .clientPage(client: client)
              buttonHidden = true
            } else {
              isAlertHidden = true
            }
          } label: {
            Text("Продолжить").font(.system(size: 15))
          }.opacity(!buttonHidden ? 1 : 0)

          NavigationLink(value: curPage, label: {
            Text("Продолжить").font(.system(size: 15))
          }).opacity(!buttonHidden ? 0 : 1)
        }
        .frame(width: 160, height: 55)
        
        
      }.onChange(of: currentCredentials) { _ in
        buttonHidden = false
      }
      .navigationTitle("")

      .padding([.horizontal, .bottom])

    }.alert("Некорректный логин или пароль!", isPresented: $isAlertHidden, actions: {
      Button("Хорошо") {}
    })
    
    .padding()
    .background(RoundedRectangle(cornerRadius: 25).stroke(lineWidth: 5))
    .frame(maxWidth: 600)
  }
}

struct LoginPageView_Previews: PreviewProvider {
  static var previews: some View {
    LoginPageView()
      .environmentObject(AppState())
  }
}
