//
//  ListView.swift
//  BudgetBuddyFinal
//
//  Created by Braulio Martin on 5/18/23.
//
import SwiftUI

struct ListView: View {
    @EnvironmentObject var transactionData: TransactionData
    @State private var budgets: [Budget] = []
    @State private var newBudgetName = ""
    @State private var newBudgetTargetAmount = ""
    
    var body: some View {
        List {
            Section(header: Text("BudgetBuddy")) {
                VStack(alignment: .leading) {
                    Text("Budgets:")
                        .font(.headline)
                    
                    ForEach(budgets) { budget in
                        VStack(alignment: .leading) {
                            Text(budget.name)
                                .font(.subheadline)
                            Text("Target Amount: \(budget.formattedTargetAmount)")
                            Text("Spent Amount: \(budget.formattedSpentAmount)")
                                .foregroundColor(budget.isOverBudget ? .red : .green)
                        }
                    }
                }
                
                HStack {
                    TextField("Budget Name", text: $newBudgetName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    TextField("Target Amount", text: $newBudgetTargetAmount)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .keyboardType(.decimalPad)
                }
                
                Button(action: {
                    addBudget()
                }) {
                    Text("Add Budget")
                }
            }
            
            Section(header: Text("Transactions")) {
                VStack(alignment: .leading) {
                    Text("Total Amount: \(formattedTotalAmount)")
                        .font(.headline)
                    Text("Remaining Amount: \(formattedRemainingAmount)")
                        .font(.headline)
                }
                .foregroundColor(totalAmount <= remainingAmount ? .green : .red)
                
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
    }
    
    private var totalAmount: Double {
        budgets.map(\.targetAmount).reduce(0, +)
    }
    
    private var remainingAmount: Double {
        totalAmount - transactionData.totalTransactionAmount
    }
    
    private var formattedTotalAmount: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        return formatter.string(from: NSNumber(value: totalAmount)) ?? "$0.00"
    }
    
    private var formattedRemainingAmount: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        return formatter.string(from: NSNumber(value: remainingAmount)) ?? "$0.00"
    }
    
    private func addBudget() {
        guard let targetAmount = Double(newBudgetTargetAmount) else {
            return
        }
        
        let newBudget = Budget(name: newBudgetName, targetAmount: targetAmount)
        budgets.append(newBudget)
        
        newBudgetName = ""
        newBudgetTargetAmount = ""
    }
}

struct Budget: Identifiable {
    let id = UUID()
    var name: String
    var targetAmount: Double
    var spentAmount: Double = 0
    
    var formattedTargetAmount: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        return formatter.string(from: NSNumber(value: targetAmount)) ?? "$0.00"
    }
    
    var formattedSpentAmount: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        return formatter.string(from: NSNumber(value: spentAmount)) ?? "$0.00"
    }
    
    var isOverBudget: Bool {
        spentAmount > targetAmount
    }
}


let transactions: [Transaction] = [] // Placeholder array for transactions

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
