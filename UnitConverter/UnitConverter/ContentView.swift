import SwiftUI

struct ContentView: View {
    @State private var inputNumber: Double?
    @State private var inputUnit: UnitLength = .meters
    @State private var outputUnit: UnitLength = .feet
    @FocusState private var amountIsFocused: Bool
    
    var outputNum: Double? {
         guard let inputNumber = inputNumber else { return nil }
         
         let inputMeasurement = Measurement(value: inputNumber, unit: inputUnit)
         
         return inputMeasurement.converted(to: outputUnit).value
     }
    
    let units: [UnitLength] = [.meters, .kilometers, .feet, .yards, .miles]
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Amount") {
                    TextField("Amount", value: $inputNumber, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                }
                
                Section("Input unit") {
                    Picker("Input Unit", selection: $inputUnit) {
                        ForEach(units, id: \.self) {
                            Text($0.symbol)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section("Output unit") {
                    Picker("Output unit", selection: $outputUnit) {
                        ForEach(units, id: \.self) {
                            Text($0.symbol)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section("Conversion") {
                    Text(outputNum?.formatted() ?? "")
                    
                }
            }
            .navigationTitle("Unit Converter")
            .toolbar{
                if amountIsFocused {
                    Button("Done") {
                        amountIsFocused = false
                    }
                }
            }
        }

    }
}

#Preview {
    ContentView()
}
