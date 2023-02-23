//
//  ContentView.swift
//  UnitConverter
//
//  Created by Felipe Silva de Borba on 22/02/23.
//

import SwiftUI
struct ContentView: View {
    @State private var input = 0.0
    @State private var inputUnit: UnitOfMeasurement = UnitOfMeasurement(label: "Meters (m)", type: .lenght, group: .meter)
    @State private var outputUnit: UnitOfMeasurement = UnitOfMeasurement(label: "Meters (m)", type: .lenght, group: .meter)
    
    private struct UnitOfMeasurement: Hashable {
        let label: String
        let type: UnitType
        let group: UnitGroup
        
        enum UnitGroup {
            case meter, kilometers, celsius, fahrenheit
        }
        enum UnitType {
            case lenght, temperature
        }
    }
    private let units: [UnitOfMeasurement] = [
        UnitOfMeasurement(label: "Meters (m)", type: .lenght, group: .meter),
        UnitOfMeasurement(label: "Kilometers (Km)", type: .lenght, group: .kilometers),
        UnitOfMeasurement(label: "Celsius (C)", type: .temperature, group: .celsius),
        UnitOfMeasurement(label: "Fahrenheit (F)", type: .temperature, group: .fahrenheit),
    ]
    
    var inputConverted:Double {
        if inputUnit.group == .meter && outputUnit.group == .kilometers {
            return input / 1000
        }
        
        if inputUnit.group == .kilometers && outputUnit.group == .meter {
            return input * 1000
        }
        
        if inputUnit.group == .celsius && outputUnit.group == .fahrenheit {
            return input * 1.8 + 32
        }
        
        
        if inputUnit.group == .fahrenheit && outputUnit.group == .celsius {
            return (input - 32) * 0.5556
        }
        
        return input
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Input", value: $input, format: .number)
                    
                    Picker("Unit of measurement", selection: $inputUnit) {
                        ForEach(units, id: \.self) {
                            Text($0.label)
                        }
                    }
                } header: {
                    Text("Input")
                }
                
                Section {
                    Text(inputConverted, format: .number)
                    
                    Picker("Unit of measurement", selection: $outputUnit) {
                    ForEach(units.filter({ UnitOfMeasurement in
                            UnitOfMeasurement.type == inputUnit.type
                        }), id: \.self) {
                            Text($0.label)
                        }
                    }
                } header: {
                    Text("Output")
                }
            }
            .navigationTitle("Unit Converter")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
