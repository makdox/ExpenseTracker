//
//  CategoriesView.swift
//  ExpenseTracker
//
//  Created by Max Donets on 20.10.2022.
//

import SwiftUI

struct CategoriesView: View {
    var transaction: Transaction
    
    var body: some View {
        List {
            ForEach(Category.categories) { category in
                Section {
                    //MARK: Subcategories
                    ForEach(category.subcategories ?? []) { subcategory in
                        let isSelected = transaction.categoryId == subcategory.id
                        
                        CategoryRow(category: subcategory, isSelected: isSelected)
                    }
                } header: {
                    //MARK: Categories
                    let isSelected = transaction.categoryId == category.id
                    
                    CategoryRow(category: category, isSelected: isSelected)
                }
            }
        }
        .listStyle(.plain)
        .navigationTitle("Category")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct CategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesView(transaction: transactionPreviewData)
    }
}
