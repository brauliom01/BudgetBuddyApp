//
//  WishListView.swift
//  BudgetBuddyFinal
//
//  Created by Braulio Martin on 5/19/23.
//
import SwiftUI

struct WishlistView: View {
    @State private var items: [WishlistItem] = []
    @State private var newItemName = ""
    @State private var newItemPrice = ""
    
    var totalItems: Int {
        items.count
    }
    
    var totalPrice: Double {
        items.reduce(0) { $0 + $1.price }
    }
    
    var body: some View {
        VStack {
            List {
                Section(header: Text("Add Item")) {
                    VStack(alignment: .leading) {
                        TextField("Item Name", text: $newItemName)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        
                        TextField("Item Price", text: $newItemPrice)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .keyboardType(.decimalPad)
                    }
                    
                    Button(action: {
                        addItem()
                    }) {
                        Text("Add")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(10)
                    }
                }
                
                Section(header: Text("Wishlist")) {
                    ForEach(items) { item in
                        VStack(alignment: .leading) {
                            Text(item.name)
                                .font(.headline)
                            Text("Price: \(item.formattedPrice)")
                                .foregroundColor(.secondary)
                            Text("Date: \(item.dateString)")
                                .foregroundColor(.secondary)
                        }
                    }
                }
            }
            
            Text("Total Items: \(totalItems)")
                .font(.headline)
                .padding()
            
            Text("Total Price: \(formattedPrice(totalPrice))")
                .font(.headline)
                .padding()
            
            Spacer()
        }
    }
    
    func addItem() {
        guard let price = Double(newItemPrice) else {
            return
        }
        
        let newItem = WishlistItem(name: newItemName, price: price, date: Date())
        items.append(newItem)
        
        newItemName = ""
        newItemPrice = ""
    }
    
    func formattedPrice(_ price: Double) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        return formatter.string(from: NSNumber(value: price)) ?? "$0.00"
    }
}

struct WishlistItem: Identifiable {
    let id = UUID()
    let name: String
    let price: Double
    let date: Date
    
    var formattedPrice: String {
        formattedPrice(price)
    }
    
    var dateString: String {
        formatDate(date)
    }
    
    private func formattedPrice(_ price: Double) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        return formatter.string(from: NSNumber(value: price)) ?? "$0.00"
    }
    
    private func formatDate(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        return dateFormatter.string(from: date)
    }
}

struct WishlistView_Previews: PreviewProvider {
    static var previews: some View {
        WishlistView()
    }
}
