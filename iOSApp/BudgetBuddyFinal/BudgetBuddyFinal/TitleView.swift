//
//  TitleView.swift
//  BudgetBuddyFinal
//
//  Created by Braulio Martin on 9/27/23.
//
import SwiftUI

struct TitleView: View {
    @Binding var isAppStarted: Bool
    @State private var isShowingLogin = false

    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)

            VStack {
                Spacer()

                Text("Budget Buddy")
                    .font(.largeTitle)
                    .foregroundColor(.green)
                    .padding()

                Image("BBlogo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 600, height: 600)

                Spacer()

                Button(action: {
                    isShowingLogin = true
                }) {
                    Text("Welcome")
                        .font(.headline)
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .sheet(isPresented: $isShowingLogin) {
                    LoginView(isAppStarted: $isAppStarted)
                }

                Spacer()
            }
        }
    }
}
