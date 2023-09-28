//
//  SettingsView.swift
//  BudgetBuddyFinal
//
//  Created by Braulio Martin on 5/18/23.
//
import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var transactionData: TransactionData

    var body: some View {
        NavigationView {
            VStack {
                
                Button(action: {
                                    openWebsite()
                                }) {
                                    Text("Open Webpage")
                                        .font(.title)
                                        .foregroundColor(.white)
                                        .padding()
                                        .background(Color.green)
                                        .cornerRadius(10)
                                }
                                .padding()

                NavigationLink(destination: ListView()) {
                    Text("List View")
                        .font(.title)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.green)
                        .cornerRadius(10)
                }.padding()

                NavigationLink(destination: DetailView()) {
                    Text("Detail View")
                        .font(.title)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.green)
                        .cornerRadius(10)
                }.padding()
                
                NavigationLink(destination: IncomeView()) {
                    Text("Income View")
                        .font(.title)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.green)
                        .cornerRadius(10)
                }.padding()
                
                NavigationLink(destination: WishlistView()) {
                    Text("WishList View")
                        .font(.title)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.green)
                        .cornerRadius(10)
                }.padding()
                
                NavigationLink(destination: HistoryView().environmentObject(transactionData)) {
                    Text("History")
                        .font(.title)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.green)
                        .cornerRadius(10)
                }.padding()
            
            }
            .navigationBarTitle("Settings")
        }
    }
    func openWebsite() {
        if let url = URL(string: "https://budget-buddy-app.vercel.app") {
            UIApplication.shared.open(url)
        }
    }
}
