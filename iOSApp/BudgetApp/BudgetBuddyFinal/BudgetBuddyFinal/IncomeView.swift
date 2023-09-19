//
//  IncomeView.swift
//  BudgetBuddyFinal
//
//  Created by Braulio Martin on 5/18/23.
//

import SwiftUI

enum IncomeCategory: String, CaseIterable, Identifiable {
    case salary
    case monthly
    case oneTime = "one time"
    
    var id: String { self.rawValue }
}

struct Income: Identifiable {
    let id = UUID()
    let name: String
    let amount: Double
    let category: IncomeCategory
    
    var formattedAmount: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        return formatter.string(from: NSNumber(value: amount)) ?? "$0.00"
    }
}

struct IncomeView: View {
    @State private var incomes: [Income] = []
    @State private var newIncomeName = ""
    @State private var newIncomeAmount = ""
    @State private var newIncomeCategory: IncomeCategory = .salary

    var totalIncome: Double {
        incomes.reduce(0) { $0 + $1.amount }
    }

    var body: some View {
        NavigationView {
            VStack {
                VStack {
                    HStack {
                        TextField("Income Source", text: $newIncomeName)
                            .textFieldStyle(RoundedBorderTextFieldStyle())

                        TextField("Amount", text: $newIncomeAmount)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .keyboardType(.decimalPad)

                        Picker("Category", selection: $newIncomeCategory) {
                            ForEach(IncomeCategory.allCases) { category in
                                Text(category.rawValue.capitalized).tag(category)
                            }
                        }
                        .pickerStyle(MenuPickerStyle())
                    }
                    .padding()

                    Button(action: {
                        if let amount = Double(newIncomeAmount) {
                            let newIncome = Income(name: newIncomeName, amount: amount, category: newIncomeCategory)
                            incomes.append(newIncome)
                            newIncomeName = ""
                            newIncomeAmount = ""
                        }
                    }) {
                        Text("Add Income")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.green)
                            .cornerRadius(10)
                    }
                    .padding(.bottom, 20)
                }

                List {
                    ForEach(incomes) { income in
                        VStack(alignment: .leading) {
                            Text(income.name)
                                .font(.headline)
                            Text("Income Amount: \(income.formattedAmount)")
                                .foregroundColor(.secondary)
                            Text("Category: \(income.category.rawValue.capitalized)")
                                .foregroundColor(.secondary)
                        }
                    }
                }
                NavigationLink(destination: PieChartView(incomes: incomes)) {
                    Text("Show Pie Chart")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                .padding()
                
                Text("Total Income: \(totalIncome, specifier: "%.2f")")
                    .font(.headline)
                    .padding()
            }
            .navigationBarTitle("Incomes")
            .background(Color.gray.opacity(0.1))
        }
    }
}
