//
//  SignUpPage.swift
//  BankSimulation
//
//  Created by Denis Beloshitskiy on 12/24/22.
//

import SwiftUI

struct SignUpPageView: View {
  @EnvironmentObject var appState: AppState

  @State private var isAlertShown = false

  @State private var fullName = ""
  @State private var login = ""
  @State private var password = ""
  @State private var birthday: Date = .now
  @State private var passport: Passport = .empty
  @State private var address = ""

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
          Text("Регистрация в ABC-банке")
            .font(.largeTitle)
            .bold()
            .foregroundColor(.white)
            .padding([.horizontal, .top])
          HStack {
            VStack(spacing: 10) {
              TextField("Полное имя", text: $fullName)
                .font(.headline)
                .foregroundColor(.white)
                .textFieldStyle(.roundedBorder)

              TextField("Логин", text: $login)
                .font(.headline)
                .foregroundColor(.white)
                .textFieldStyle(.roundedBorder)

              SecureField("Пароль", text: $password)
                .font(.headline)
                .foregroundColor(.white)
                .textFieldStyle(.roundedBorder)

//              DatePicker(selection: , label: <#T##() -> _#>)

              TextField("Адрес", text: $address)
                .font(.headline)
                .foregroundColor(.white)
                .textFieldStyle(.roundedBorder)

            }.padding()
          }
        }.frame(width: cardSize.width, height: cardSize.height)
          .padding()

        ZStack {
          Button {
            ClientFactory(appState: appState)
              .makeClient(
                fullName: fullName,
                login: login,
                password: password,
                birthday: birthday,
                passport: passport,
                address: address
              )
            isAlertShown = true
          } label: {
            Text("Зарегистироваться").font(.headline)
          }.buttonStyle(.bordered)
        }
      }
      .padding([.horizontal, .bottom])

    }.alert("Вы зарегистированы!", isPresented: $isAlertShown, actions: {
      Button("Отлично") {}
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

struct SignUpPageView_Previews: PreviewProvider {
  static var previews: some View {
    SignUpPageView()
      .environmentObject(AppState())
  }
}
