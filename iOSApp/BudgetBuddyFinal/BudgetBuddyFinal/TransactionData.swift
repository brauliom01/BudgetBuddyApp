//
//  TransactionData.swift
//  BudgetBuddyFinal
//
//  Created by Braulio Martin on 5/18/23.
//

import SwiftUI
import Combine

class TransactionData: ObservableObject {
    @Published var totalTransactionAmount: Double = 0.0
}
