//
//  BudgetBuddyFinalApp.swift
//  BudgetBuddyFinal
//
//  Created by Braulio Martin on 5/18/23.
//

import SwiftUI
import Combine

@main

struct BudgetBuddyFinalApp: App {
    @StateObject var transactionData = TransactionData()
    @State private var isAppStarted = false
    
    var body: some Scene {
        WindowGroup {
            if isAppStarted {
                NavigationView {
                    ContentView()
                        .environmentObject(transactionData)
                }
            } else {
                // Show the title view
                TitleView(isAppStarted: $isAppStarted)
            }
        }
    }
}
