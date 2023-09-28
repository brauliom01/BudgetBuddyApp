//
//  HomeView.swift
//  BudgetBuddyFinal
//
//  Created by Braulio Martin on 5/18/23.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var transactionData: TransactionData
    @State private var transactions: [Transaction] = [] // Assuming Transaction is a custom model
    @State private var newName = ""
    @State private var newPrice = ""
    
    var totalAmount: Double {
        transactions.reduce(0) { $0 + $1.price }
    }
    
    var formattedTotalAmount: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        return formatter.string(from: NSNumber(value: totalAmount)) ?? "$0.00"
    }
    
    var body: some View {
        NavigationView {
            VStack {

                List {
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
                    .onDelete(perform: deleteTransaction)
                }
                
                Text("Total Amount: \(formattedTotalAmount)")
                    .font(.headline)
                    .padding()
                
                Spacer()
                
                VStack {
                    HStack {
                        TextField("Transaction Name", text: $newName)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        
                        TextField("Price", text: $newPrice)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .keyboardType(.decimalPad)
                    }
                    .padding()
                    
                    Button(action: {
                        if let price = Double(newPrice) {
                            let newTransaction = Transaction(name: newName, price: price, date: Date())
                            transactions.append(newTransaction)
                            transactionData.totalTransactionAmount += price
                            newName = ""
                            newPrice = ""
                        }
                    }) {
                        Text("Add Transaction")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.green)
                            .cornerRadius(10)
                    }
                    .padding(.bottom, 20)
                    
                    NavigationLink(destination: BarGraphView(transactions: transactions)) {
                        Text("View Bar Graph")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.green)
                            .cornerRadius(10)
                    }
                }
            }
            .navigationBarTitle("Transactions")
            .background(Color.gray.opacity(0.1))
        }
    }
    
    func deleteTransaction(at offsets: IndexSet) {
        transactions.remove(atOffsets: offsets)
    }
}


struct Transaction: Identifiable {
    let id = UUID()
    let name: String
    let price: Double
    let date: Date
    
    var formattedPrice: String {
        String(format: "%.2f", price)
    }
    
    var dateString: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        return dateFormatter.string(from: date)
    }
}

struct BarGraphView: View {
    var transactions: [Transaction]
    
    var body: some View {
        VStack {
            Text("Bar Graph")
                .font(.headline)
                .padding()
            
            BarChart(transactions: transactions)
                .padding()
        }
        .navigationBarTitle("Bar Graph")
    }
}

struct BarChart: View {
    var transactions: [Transaction]
    
    let barWidth: CGFloat = 30.0
    
    var body: some View {
        VStack {
            HStack(alignment: .bottom) {
                ForEach(transactions, id: \.id) { transaction in
                    VStack {
                        ZStack(alignment: .bottom) {
                            Capsule()
                                .frame(width: barWidth, height: calculateBarHeight(transaction.price))
                                .foregroundColor(.blue)
                            Text(String(format: "%.2f", transaction.price))
                                .foregroundColor(.white)
                                .padding(.bottom, 4)
                        }
                        Text(transaction.dateString)
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                    .padding(.trailing, 10)
                }
            }
        }
    }
    
    private func calculateBarHeight(_ price: Double) -> CGFloat {
        let maxHeight: CGFloat = 200
        let maxPrice = transactions.map(\.price).max() ?? 0
        return CGFloat(price / maxPrice) * maxHeight
    }
}

