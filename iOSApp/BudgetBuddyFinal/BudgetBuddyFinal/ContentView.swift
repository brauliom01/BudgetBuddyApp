//
//  ContentView.swift
//  BudgetBuddyFinal
//
//  Created by Braulio Martin on 5/18/23.
//
import SwiftUI
struct ContentView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                        .font(.system(size: 12, weight: .bold)) // Set text to black and bold
                }
            
            ListView()
                .tabItem {
                    Image(systemName: "list.bullet")
                    Text("Budget")
                        .font(.system(size: 12, weight: .bold)) // Set text to black and bold
                }
            
            DetailView()
                .tabItem {
                    Image(systemName: "info.circle")
                    Text("Bill")
                        .font(.system(size: 12, weight: .bold)) // Set text to black and bold
                }
            
            IncomeView()
                .tabItem {
                    Image(systemName: "dollarsign.circle")
                    Text("Income")
                        .font(.system(size: 12, weight: .bold)) // Set text to black and bold
                }
            
            WishlistView()
                .tabItem {
                    Image(systemName: "dollarsign.circle")
                    Text("WishList")
                        .font(.system(size: 12, weight: .bold)) // Set text to black and bold
                }
            
            
            SettingsView()
                .tabItem {
                    Image(systemName: "gear")
                    Text("Settings")
                        .font(.system(size: 12, weight: .bold)) // Set text to black and bold
                }
        }
    }
}


