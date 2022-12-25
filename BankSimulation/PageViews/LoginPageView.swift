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
    LoginView(model: LoginPageViewModel(appState: appState))
  }
}

struct LoginView: View {
  @State private var currentCredentials: Credentials = .empty
  @State private var login = "Lang"
  @State private var password = "VNB43JLX5MR"
  @State private var isAlertHidden = false
  @State var model: LoginPageViewModel
  @State private var currentPage = Page.loginPage
  @State private var buttonHidden = false
  var body: some View {
    ZStack {
      RoundedRectangle(cornerRadius: 25, style: .continuous)
        .fill(Color.background)
        .frame(
          minWidth: backgoroundCardSize.width,
          minHeight: backgoroundCardSize.height
        )
        .padding()
      VStack {
        VStack(alignment: .leading) {
          Text("Вход в ABC-банк")
            .font(.largeTitle)
            .bold()
            .foregroundColor(.white)
            .padding([.horizontal, .top])
          HStack {
            VStack(spacing: 10) {
              TextField("Логин", text: $currentCredentials.login)
                .font(.headline)
                .foregroundColor(.white)
                .textFieldStyle(.roundedBorder)

              SecureField("Пароль", text: $currentCredentials.password)
                .font(.headline)
                .foregroundColor(.white)
                .textFieldStyle(.roundedBorder)
            }.padding()
          }
        }.frame(width: cardSize.width, height: cardSize.height)
          .padding()

        ZStack {
          Button {
            currentCredentials.login = login
            currentCredentials.password = password

            if let tuple = model.performLogin(with: currentCredentials) {
              switch tuple.role {
                case .client: currentPage = .clientPage(client: model.getClient(by: tuple.id))
                case .manager: currentPage = .managerPage(manager: model.getManager(by: tuple.id))
                case .admin: currentPage = .adminPage(admin: model.getAdmin(by: tuple.id))
              }
              buttonHidden = true
            } else {
              isAlertHidden = true
            }
          } label: {
            Text("Продолжить").font(.headline)
          }.opacity(!buttonHidden ? 1 : 0)
            .buttonStyle(.bordered)

          NavigationLink(value: currentPage, label: {
            Text("Продолжить").font(.headline)
          }).opacity(!buttonHidden ? 0 : 1)
            .buttonStyle(.bordered)
        }

        NavigationLink(value: Page.registrationPage, label: {
          Text("Регистрация").font(.headline)
        }).buttonStyle(.plain)

      }.onChange(of: currentCredentials) { _ in
        buttonHidden = false
      }
      .navigationTitle("")

      .padding([.horizontal, .bottom])

    }.alert("Некорректный логин или пароль!", isPresented: $isAlertHidden, actions: {
      Button("Хорошо") {}
    })
  }
}

private let screen = CGSize(width: 1000, height: 750)
private let backgoroundCardSize = CGSize(
  width: screen.width * 0.7,
  height: screen.height * 0.3
)
private let cardSize = CGSize(
  width: backgoroundCardSize.width * 0.5,
  height: backgoroundCardSize.height * 0.5
)

struct LoginPageView_Previews: PreviewProvider {
  static var previews: some View {
    LoginPageView()
      .environmentObject(AppState())
  }
}
