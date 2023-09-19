//
//  HistoryView.swift
//  BudgetBuddyFinal
//
//  Created by Braulio Martin on 5/18/23.
//

import SwiftUI

struct HistoryView: View {
    @EnvironmentObject var transactionData: TransactionData
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Transaction History")) {
                    ForEach(transactions) { transaction in
                        VStack(alignment: .leading) {
                            Text(transaction.name)
                                .font(.headline)
                            Text("Price: \(transaction.formattedPrice)")
                                .foregroundColor(.secondary)
                            Text("Date: \(transaction.dateString)")
                                .foregroundColor(.secondary)
                        }
                    }
                }
            }
            .navigationBarTitle("Transaction History")
        }
    }
}
