//
//  DetailView.swift
//  BudgetBuddyFinal
//
//  Created by Braulio Martin on 5/18/23.
//

import SwiftUI

class UpcomingBill: ObservableObject, Identifiable {
    let id = UUID()
    @Published var name: String
    @Published var amount: Double
    @Published var category: Category
    @Published var date: Date
    @Published var recurring: Bool
    @Published var recurringInterval: RecurringInterval
    
    init(name: String, amount: Double, category: Category, date: Date, recurring: Bool, recurringInterval: RecurringInterval) {
        self.name = name
        self.amount = amount
        self.category = category
        self.date = date
        self.recurring = recurring
        self.recurringInterval = recurringInterval
    }
    
    var formattedAmount: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        return formatter.string(from: NSNumber(value: amount)) ?? "$0.00"
    }
    
    var dateString: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        return dateFormatter.string(from: date)
    }
}

enum RecurringInterval: String, CaseIterable {
    case monthly = "Monthly"
    case yearly = "Yearly"
}

enum Category: String, CaseIterable {
    case subscription
    case rent
    case utilities
}

struct DetailView: View {
    @State private var upcomingBills: [UpcomingBill] = []
    @State private var newBillName = ""
    @State private var newBillAmount = ""
    @State private var selectedCategory: Category = .subscription
    @State private var isRecurring = false
    @State private var selectedInterval: RecurringInterval = .monthly
    @State private var showBillDetails: UpcomingBill?

    var body: some View {
        VStack {
            List {
                Section(header: Text("Create Upcoming Bill")) {
                    VStack(alignment: .leading) {
                        TextField("Bill Name", text: $newBillName)
                            .textFieldStyle(RoundedBorderTextFieldStyle())

                        TextField("Amount", text: $newBillAmount)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .keyboardType(.decimalPad)

                        Picker("Category", selection: $selectedCategory) {
                            ForEach(Category.allCases, id: \.self) { category in
                                Text(category.rawValue.capitalized)
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())

                        Toggle("Recurring", isOn: $isRecurring)
                            .padding(.vertical)

                        if isRecurring {
                            Picker("Recurring Interval", selection: $selectedInterval) {
                                ForEach(RecurringInterval.allCases, id: \.self) { interval in
                                    Text(interval.rawValue)
                                }
                            }
                            .pickerStyle(SegmentedPickerStyle())
                        }

                        DatePicker("Date", selection: .constant(Date()), displayedComponents: .date)
                    }

                    Button(action: {
                        createBill()
                    }) {
                        Text("Add Bill")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(10)
                    }
                }

                Section(header: Text("Upcoming Bills")) {
                    ForEach(upcomingBills, id: \.id) { bill in
                        Button(action: {
                            showBillDetails = bill
                        }) {
                            VStack(alignment: .leading) {
                                Text(bill.name)
                                    .font(.headline)
                                Text("Amount: \(bill.formattedAmount)")
                                    .foregroundColor(.secondary)
                                Text("Category: \(bill.category.rawValue.capitalized)")
                                    .foregroundColor(.secondary)
                                Text("Date: \(bill.dateString)")
                                    .foregroundColor(.secondary)
                            }
                        }
                    }
                }
            }
            .sheet(item: $showBillDetails) { bill in
                BillDetailView(bill: bill)
            }
        }
    }

    func createBill() {
        guard let amount = Double(newBillAmount) else {
            return
        }

        let newBill = UpcomingBill(name: newBillName, amount: amount, category: selectedCategory, date: Date(), recurring: isRecurring, recurringInterval: selectedInterval)
        upcomingBills.append(newBill)

        newBillName = ""
        newBillAmount = ""
        selectedCategory = .subscription
    }
}

    
    struct BillDetailView: View {
        @ObservedObject var bill: UpcomingBill
        
        var body: some View {
            VStack(alignment: .leading) {
                Text("Bill Name: \(bill.name)")
                    .font(.headline)
                Text("Amount: \(bill.formattedAmount)")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                Text("Category: \(bill.category.rawValue.capitalized)")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                Text("Date: \(bill.dateString)")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                Toggle("Recurring", isOn: $bill.recurring)
                    .padding(.vertical)
                if bill.recurring {
                    Text("Recurring Interval: \(bill.recurringInterval.rawValue)")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                Button(action: {
                    // Perform any necessary actions when the bill is saved
                }) {
                    Text("Save")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                }
            }
            .padding()
        }
    }

