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
                }
            
            ListView()
                .tabItem {
                    Image(systemName: "list.bullet")
                    Text("Budget")
                }
            
            DetailView()
                .tabItem {
                    Image(systemName: "info.circle")
                    Text("Bill")
                }
            
            IncomeView()
                .tabItem {
                    Image(systemName: "dollarsign.circle")
                               Text("Income")
                           }
            WishlistView()
                .tabItem {
                    Image(systemName: "dollarsign.circle")
                               Text("WishList")
                           }
            SettingsView()
                .tabItem {
                    Image(systemName: "gear")
                    Text("Settings")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

