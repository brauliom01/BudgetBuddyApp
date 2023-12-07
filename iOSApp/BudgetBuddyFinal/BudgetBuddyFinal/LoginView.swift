//
//  LoginView.swift
//  BudgetBuddyFinal
//
//  Created by Braulio Martin on 12/5/23.
//
import SwiftUI

struct LoginView: View {
    @Binding var isAppStarted: Bool
    @State private var username: String = ""
    @State private var password: String = ""

    var body: some View {
        VStack {
            Image("BBlogo")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
                .padding()

            Spacer()

            VStack {
                TextField("Username", text: $username)
                    .padding()
                    .foregroundColor(.black) // Set text color to black
                    .font(.system(size: 16, weight: .bold)) // Set font to bold and white
            }
            .background(RoundedRectangle(cornerRadius: 10).fill(Color.white)) // White box around username

            VStack {
                SecureField("Password", text: $password)
                    .padding()
                    .foregroundColor(.black) // Set text color to black
                    .font(.system(size: 16, weight: .bold)) // Set font to bold and white
            }
            .background(RoundedRectangle(cornerRadius: 10).fill(Color.white)) // White box around password

            Button(action: {
                // Simulate successful login for now
                isAppStarted = true
            }) {
                Text("Login")
                    .font(.headline)
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }

            Spacer()
        }
        .padding()
        .background(Color.black.edgesIgnoringSafeArea(.all)) // Set the overall background to black
    }
}
