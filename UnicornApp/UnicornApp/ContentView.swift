//
//  ContentView.swift
//  UnicornApp
//
//  Created by Coder on 2022-10-26.
//

import SwiftUI

struct ContentView: View {
    @State private var path = [String]()
    var body: some View {
        NavigationStack(path: $path) {
            List {
                NavigationLink("PAYLOAD", value: "payload value")
                
                NavigationLink("PAYLOAD2", value: "payload value 2")
                
                NavigationLink("PAYLOAD3", value: "payload value 3")
                
                Button("Navigate to EngineRoom") {
                    path.append("EngineRoom")
                }
            }
            .navigationDestination(for: String.self) { stringValue in
                VStack {
                    Text(stringValue)
                        .foregroundColor(.blue)
                    
                    Button("Navigate to Reactor Room") {
                        path.append("ReactorRoom")
                    }
                    
                    Button("Back to Root") {
                        path.removeAll()
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
