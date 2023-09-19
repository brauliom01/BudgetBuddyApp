//
//  PiChartView.swift
//  BudgetBuddyFinal
//
//  Created by Braulio Martin on 5/19/23.
//


import SwiftUI

struct PieChartView: View {
    var incomes: [Income]
    
    var body: some View {
        VStack {
            Text("Income Categories Pie Chart")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()
            
            PieChart(incomes: incomes)
        }
        .navigationTitle("Pie Chart")
    }
}

struct PieChart: View {
    var incomes: [Income]
    var totalIncome: Double {
        incomes.map { $0.amount }.reduce(0, +)
    }
    
    var body: some View {
        GeometryReader { geometry in
            let radius = min(geometry.size.width, geometry.size.height) / 2
            let center = CGPoint(x: geometry.size.width / 2, y: geometry.size.height / 2)
            
            ZStack {
                ForEach(incomes.indices, id: \.self) { index in
                    let startAngle = self.startAngle(for: index)
                    let endAngle = self.endAngle(for: index)
                    let midAngle = (startAngle + endAngle) / 2
                    
                    Path { path in
                        path.move(to: center)
                        path.addArc(center: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: false)
                    }
                    .fill(self.color(for: index))
                    
                    Text("\(self.incomes[index].name)")
                        .position(self.labelPosition(midAngle: midAngle, in: geometry.size))
                }
            }
        }
    }
    
    private func startAngle(for index: Int) -> Angle {
        let startFraction = self.incomes.prefix(index).map { $0.amount }.reduce(0, +) / totalIncome
        return .degrees(360 * startFraction)
    }
    
    private func endAngle(for index: Int) -> Angle {
        let endFraction = self.incomes.prefix(index+1).map { $0.amount }.reduce(0, +) / totalIncome
        return .degrees(360 * endFraction)
    }
    
    private func color(for index: Int) -> Color {
        let colors: [Color] = [.red, .green, .blue, .yellow, .orange, .purple]
        return colors[index % colors.count]
    }
    
    private func labelPosition(midAngle: Angle, in size: CGSize) -> CGPoint {
        let labelRadius = min(size.width, size.height) / 4
        let radians = midAngle.radians
        let xOffset = Double(labelRadius) * cos(radians)
        let yOffset = Double(labelRadius) * sin(radians)
        return CGPoint(x: size.width / 2 + CGFloat(xOffset), y: size.height / 2 + CGFloat(yOffset))
    }
}


