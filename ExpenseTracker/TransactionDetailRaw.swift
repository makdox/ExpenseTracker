//
//  TransactionDetailRaw.swift
//  ExpenseTracker
//
//  Created by Max Donets on 19.10.2022.
//

import SwiftUI
import SwiftUIFontIcon

struct TransactionDetailRaw: View {
    var icon: FontAwesomeCode
    var title: String
    var text: String
    
    var body: some View {
        HStack(spacing: 12) {
            //MARK: Icon
            FontIcon.text(.awesome5Solid(code: icon), fontsize: 24, color: Color.icon)
                .frame(width: 32, height: 32)
            
            VStack(alignment: .leading, spacing: 6) {
                //MARK: Title
                Text(title)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                //MARK: Text
                Text(text)
                    .lineLimit(1)
            }
        }
        .padding(.vertical, 8)
        
    }
}

struct TransactionDetailRaw_Previews: PreviewProvider {
    static var previews: some View {
        TransactionDetailRaw(icon: .store, title: "Merchant", text: "Apple")
            .preferredColorScheme(.dark)
    }
}
