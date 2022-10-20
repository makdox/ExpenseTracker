//
//  TransactionView.swift
//  ExpenseTracker
//
//  Created by Max Donets on 19.10.2022.
//

import SwiftUI

struct TransactionView: View {
    var transaction: Transaction
    
    var body: some View {
        List {
            //MARK: Hero
            VStack(spacing: 6) {
                Text(transaction.signedAmount, format: .currency(code: "USD"))
                    .font(.largeTitle)
                    .bold()
                
                Text(transaction.merchant)
                    .lineLimit(1)
                
                Text(transaction.dateParsed, format: .dateTime.year().month(.wide).day())
            }
            .frame(maxWidth: .infinity, alignment: .center)
            .listRowSeparator(.hidden, edges: .top)
            .padding(.vertical, 16)
            
            //MARK: Merchant
            TransactionDetailRaw(icon: .store, title: "Merchant", text: transaction.merchant)
            
            //MARK: Date
            TransactionDetailRaw(icon: .calendar, title: "Dtae", text: transaction.dateParsed.formatted(.dateTime.year().month(.wide).day().weekday(.wide)))
            
            //MARK: Financial Institution
            TransactionDetailRaw(icon: .landmark, title: "Financial Institution", text: transaction.institution)
            
            //MARK: Account
            TransactionDetailRaw(icon: .credit_card, title: "Account", text: transaction.account)
            
            //MARK: Category
            NavigationLink {
                CategoriesView(transaction: transaction)
            } label: {
                TransactionDetailRaw(icon: .list, title: "Category", text: transaction.categoryItem.name)
            }
        }
        .listStyle(.plain)
        .navigationTitle("Transaction")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct TransactionView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            TransactionView(transaction: transactionPreviewData)
        }
    }
}
