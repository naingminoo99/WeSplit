//
//  ContentView.swift
//  WeSplit
//
//  Created by Ryan on 17/2/23.
//

import SwiftUI

struct ContentView: View {
    
    let tipPercentages = [10,15,20,25,0]
    @State private var checkAmount = 0.0
    @State private var numberOfpeople = 2
    @State private var tipPercentage = 20
    @FocusState private var amountIsFocused : Bool
    
    var totalPerPerson : Double {
        let peopleCount = Double(numberOfpeople + 2)
        let tipSelection = Double(tipPercentage)
        
        let tipValue = checkAmount/100 * tipSelection
        let grandTotal = checkAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        return amountPerPerson
    }
    
    var body: some View {
        NavigationView {
            Form {
                // First Section
                Section {
                    TextField("Check Amount", value: $checkAmount, format:
                            .currency(code: Locale.current.currency?.identifier ?? "USD"))
                    .keyboardType(.decimalPad)
                    .focused($amountIsFocused)
                    Picker("Number of people", selection: $numberOfpeople) {
                        ForEach(2..<13){
                            Text("\($0) People")
                        }
                    }
                } // End of First Section
                
                // Second Section
                Section {
                    Picker("Tip Percent", selection: $tipPercentage) {
                        ForEach(tipPercentages, id: \.self) {
                            Text($0, format:.percent)
                        }
                    }
                    .pickerStyle(.segmented )
                } header: {
                    Text("How much Tip you want to leave")
                }
                
                // Third Section
                Section {
                    Text(totalPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                } header: {
                    Text("Total Amount Per Person")
                }
            }
            .navigationTitle("WeSplit")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Done"){
                        amountIsFocused = false
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
