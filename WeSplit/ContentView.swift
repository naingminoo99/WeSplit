//
//  ContentView.swift
//  WeSplit
//
//  Created by Ryan on 17/2/23.
//

import SwiftUI

struct ContentView: View {
    
    let occupations = ["Student","Developer","Designer","Manager"]
    @State private var selectedOcupation = "Student"
    @State private var tapCount = 0
    @State private var name = ""
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Text("Hello, world!")
                    Text("I am the setting App, world!")
                }
                Section {
                    Text("section, world! \(name)")
                    Button("Tap Count \(tapCount)") {
                        tapCount += 1
                    }
                }
                Section {
                    TextField("Entr Your name", text: $name)
                    Picker("Select Your Occupation", selection: $selectedOcupation) {
                        ForEach(occupations, id: \.self){
                            Text($0)
                        }
                    }
                }
            }.navigationTitle("SwiftUI")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
