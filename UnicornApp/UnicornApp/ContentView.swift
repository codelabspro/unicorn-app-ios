//
//  ContentView.swift
//  UnicornApp
//
//  Created by Coder on 2022-10-26.
//

import SwiftUI

struct ContentView: View {
    @State private var path = NavigationPath()
    var body: some View {
        NavigationStack(path: $path) {
            List {
                Section("Engine List") {
                    ForEach(Engine.samples) { engine in
                        NavigationLink(value: engine) {
                            VStack(alignment: .leading) {
                                Text(engine.name)
                                Text(engine.description)
                                    .foregroundColor(.secondary)
                            }
                        }
                    }
                }
                
                Section("Reactor List") {
                    ForEach(Reactor.samples) { reactor in
                        NavigationLink(value: reactor) {
                            VStack(alignment: .leading) {
                                Text(reactor.name)
                                Text(reactor.description)
                                    .foregroundColor(.secondary)
                            }
                        }
                    }
                }
            }
            .navigationDestination(for: Engine.self) { engine in
                Text(engine.name)
                    .font(.headline)
            }
            .navigationDestination(for: Reactor.self) { reactor in
                Text(reactor.name)
                    .font(.headline)
            }
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
