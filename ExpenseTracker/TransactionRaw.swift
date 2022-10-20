//
//  TransactionRaw.swift
//  ExpenseTracker
//
//  Created by Max Donets on 18.10.2022.
//

import SwiftUI
import SwiftUIFontIcon

struct TransactionRaw: View {
    var transaction: Transaction
    var body: some View {
        HStack(spacing: 20) {
            //MARK: Transaction Category Icon
            RoundedRectangle(cornerRadius: 20, style: .continuous).fill(Color.icon.opacity(0.3))
                .frame(width: 44, height: 44)
                .overlay {
                    FontIcon.text(.awesome5Solid(code: transaction.icon), fontsize: 24, color: Color.icon)
                }
            
            VStack(alignment: .leading, spacing: 6) {
                //MARK: Transaction Merchant
                Text(transaction.merchant)
                    .font(.subheadline)
                    .bold()
                    .lineLimit(1)
                
                //MARK: Transaction Category
                Text(transaction.categoryItem.name)
                    .font(.footnote)
                    .opacity(0.7)
                    .lineLimit(1)
                
                //MARK: Transaction Date
                Text(transaction.dateParsed, format: .dateTime.year().month().day())
                    .font(.footnote)
                    .foregroundColor(.secondary)
            }
            
            Spacer()
            
            //MARK: Transaction Amount
            Text(transaction.signedAmount, format: .currency(code: "USD"))
                .bold()
                .foregroundColor(transaction.type == TransactionType.credit.rawValue ? Color.text : .primary)
        }
        .padding([.top, .bottom], 8)
    }
}

struct TransactionRaw_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TransactionRaw(transaction: transactionPreviewData)
            TransactionRaw(transaction: transactionPreviewData)
                .preferredColorScheme(.dark)
        }
    }
}
