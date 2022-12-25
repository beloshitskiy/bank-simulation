//
//  ClientPageView.swift
//  BankSimulation
//
//  Created by Denis Beloshitskiy on 12/24/22.
//

import SwiftUI

struct ClientPageView: View {
  @EnvironmentObject var appState: AppState
  var client: Client
  var body: some View {
    HStack {
      List {
        Section("Счета") {
          ForEach(
            appState.storage.accounts.filter { $0.client_id == client.id },
            id: \.self
          ) { account in
            AccountCardView(account: account)
          }
        }.font(.title2).bold().foregroundColor(.white)
        
        
        HStack {
        
          Button {
//            let factory = AccountFactory()
            
            
            
          } label: {
            Image(systemName: "plus")
              .clipShape(Circle().stroke(lineWidth: 5))
          }
          
          Text("Открыть новый счет")
            .font(.headline).bold()
        }
        
      }
      .frame(width: 325)

      List {
        Section("История операций") {
          ForEach(
            appState.storage.transactions.filter {
              var clientAccounts = Set<Int>()
              appState.storage.accounts.filter { $0.client_id == client.id }
                .forEach { account in
                  clientAccounts.insert(account.client_id)
                }
              return clientAccounts.contains($0.sender_account) || clientAccounts
                .contains($0.receiver_account)
            },
            id: \.self
          ) { transaction in
            TransactionCardView(
              transaction: transaction,
              senderAccount: appState.storage.accounts
                .first(where: { $0.id == transaction.sender_account }),
              recieverAccount: appState.storage.accounts
                .first(where: { $0.id == transaction.receiver_account })
            )
          }
        }.font(.title2).bold().foregroundColor(.white)
      }
    }.navigationTitle("Личный кабинет")
  }
}

struct AccountCardView: View {
  let account: Account
  var body: some View {
    HStack {
      Text(account.currency.sign)
        .font(.title)
        .padding()

      VStack(alignment: .leading) {
        Text(account.name.prefix(15)).font(.headline)
        Text(account.balance, format: .currency(code: account.currency.code)).font(.subheadline)
      }

    }.padding().colorInvert()
      .background(Rectangle().cornerRadius(25).foregroundColor(.white))
      .frame(width: 300)
  }
}

struct TransactionCardView: View {
  let transaction: Transaction
  let senderAccount: Account?
  let recieverAccount: Account?

  var body: some View {
    if let senderAccount, let recieverAccount {
      HStack(alignment: .center) {
        Text(recieverAccount.currency.sign)
          .font(.title)
          .padding()

        VStack(alignment: .leading) {
          Text(
            "\(String(recieverAccount.name.prefix(15))) -> \(String(senderAccount.name.prefix(15)))"
          )
          .font(.subheadline)
          Text(transaction.description).font(.callout)
        }

        Spacer()

        VStack(alignment: .trailing) {
          if transaction.type == TransactionType.ICA {
            Text(transaction.amount, format: .currency(code: recieverAccount.currency.code))
              .font(.headline).bold()
          } else {
            if transaction.sender_account != senderAccount.id {
              Text(transaction.amount, format: .currency(code: recieverAccount.currency.code))
                .font(.headline).bold()
            } else {
              Text(-transaction.amount, format: .currency(code: recieverAccount.currency.code))
                .font(.headline).bold()
            }
          }

          Spacer()

          Text(transaction.type.localized).font(.callout)
          Text(transaction.status.localized).font(.callout)
        }
      }
      .padding().colorInvert()
      .background(Rectangle().cornerRadius(25).foregroundColor(.white))
    }
  }
}

//struct NewAccountView: View {
//
//
//  var body: some View {
//
//
//  }
//}
