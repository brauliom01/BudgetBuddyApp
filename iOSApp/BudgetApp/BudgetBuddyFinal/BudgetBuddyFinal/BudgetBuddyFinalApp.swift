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
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(transactionData)

        }
    }
    
}
