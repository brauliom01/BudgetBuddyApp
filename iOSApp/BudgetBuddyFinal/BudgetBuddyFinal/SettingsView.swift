//
//  SettingsView.swift
//  BudgetBuddyFinal
//
//  Created by Braulio Martin on 5/18/23.
//
import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var transactionData: TransactionData

    let darkGreen = Color.green.opacity(0.5) // Adjust opacity and color as needed

    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color.green, darkGreen]), startPoint: .top, endPoint: .bottom) // Use the darkGreen color here
                    .edgesIgnoringSafeArea(.all)
                
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
                    
                    Button(action: {
                        openExpedia()
                    }) {
                        Text("Expedia")
                            .font(.title)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(10)
                    }
                    .padding()
                    
                    Button(action: {
                        openTrip()
                    }) {
                        Text("Trip Advisor")
                            .font(.title)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.yellow)
                            .cornerRadius(10)
                    }
                    .padding()
                    
                    Button(action: {
                        openExperian()
                    }) {
                        Text("Experian")
                            .font(.title)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(10)
                    }
                    .padding()
                    
                    Button(action: {
                        openGoogle()
                    }) {
                        Text("Google")
                            .font(.title)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.green)
                            .cornerRadius(10)
                    }
                    .padding()
                }
                .background(Color.white.opacity(0.7)) // Semi-transparent white background for content
                .cornerRadius(20) // Rounded corners for content
                .padding()
            }
            .navigationBarTitle("Settings")
        }
    }
    
    func openWebsite() {
        if let url = URL(string: "https://budget-buddy-app.vercel.app") {
            UIApplication.shared.open(url)
        }
    }
    
    func openGoogle() {
        if let url = URL(string: "https://google.com") {
            UIApplication.shared.open(url)
        }
    }
    func openExpedia() {
        if let url = URL(string: "https://expedia.com") {
            UIApplication.shared.open(url)
        }
    }
    func openTrip() {
        if let url = URL(string: "https://tripadvisor3.com") {
            UIApplication.shared.open(url)
        }
    }
    func openExperian() {
        if let url = URL(string: "https://experian.com") {
            UIApplication.shared.open(url)
        }
    }
}


