//
//  ContentView.swift
//  Drawing
//
//  Created by Felipe Silva de Borba on 28/03/23.
//

import SwiftUI

struct Arrow: Shape {
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let thikness = rect.maxX / 4

        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.maxX - thikness, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.maxX - thikness, y: rect.maxY))
        path.addLine(to: CGPoint(x: thikness, y: rect.maxY))
        path.addLine(to: CGPoint(x: thikness, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        path.closeSubpath()
        
        return path
    }
}

struct ColorCyclingRectangle: View {
    var amount = 0.0
    var steps = 100

    var body: some View {
        ZStack {
            ForEach(0..<steps) { value in
                Rectangle()
                    .inset(by: Double(value))
                    .strokeBorder(color(for: value, brightness: 1), lineWidth: 2)
            }
        }
    }

    func color(for value: Int, brightness: Double) -> Color {
        var targetHue = Double(value) / Double(steps) + amount

        if targetHue > 1 {
            targetHue -= 1
        }

        return Color(hue: targetHue, saturation: 1, brightness: brightness)
    }
}

struct ContentView: View {
    @State private var thikness = 10.0
    @State private var colorCycle = 0.0

    var body: some View {
        VStack(spacing: 0) {
            Spacer()

            Arrow()
                .stroke(.blue, lineWidth: thikness)
                .frame(width: 200, height: 200)
                .onTapGesture {
                    withAnimation {
                        thikness = Double.random(in: 5...30)
                    }
                }
                //.border(Color.black, width: 1)
            
            Spacer()
            
            ColorCyclingRectangle(amount: colorCycle)
                .frame(width: 300, height: 200)
            
            Spacer()

            //*
            Group {
                Text("Hue: \(thikness, format: .number.precision(.fractionLength(2)))")
               Slider(value: $colorCycle)

            }
            // */
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
