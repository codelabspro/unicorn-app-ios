//
//  ContentView.swift
//  UnicornApp
//
//  Created by Coder on 2022-10-26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            List {
                NavigationLink("PAYLOAD", value: "payload value")
                
                NavigationLink("PAYLOAD2", value: "payload value 2")
                
                NavigationLink("PAYLOAD3", value: "payload value 3")
            }
            .navigationDestination(for: String.self) { stringValue in
                Text(stringValue)
                    .foregroundColor(.blue)
            }
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
