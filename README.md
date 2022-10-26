# unicorn-app-ios
unicorn-app-ios


## Steps

### Step 0 - Bootstrap Xcode 14.0.1 iOS App project using sensible defaults 
  
The initial default code for ContentView.swift looks as below
```
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


```

### Step 1 - NavigationStack and NavigationLink
* We may modify ContentView.swift as below

```
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

```

### Step 2 -  Navigation Path and Programmatic Navigation
* We may modify ContentView.swift as below

```
import SwiftUI

struct ContentView: View {
    @State private var path = [String]()
    var body: some View {
        NavigationStack(path: $path){
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
                    
                    Button("Back to Previous") {
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


```
Step 3 - Dynamic Navigation Using NavigationPath
* Add the Engine struct

```
import Foundation

struct Engine: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let description: String

}

extension Engine {
    static let samples: [Engine] = [
        .init(name: "Merlin", description: "SpaceX Merlin 1 Rocket Engine"),
        .init(name: "Kestrel", description: "SpaceX Kestrel Rocket Engine"),
        .init(name: "Raptor", description: "SpaceX Raptor Rocket Engine"),
        .init(name: "Methox", description: "SpaceX Methox Rocket Engine")
    ]
}

```

* Add the Reactor struct

```
import Foundation

struct Reactor: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let description: String

}

extension Reactor {
    static let samples: [Reactor] = [
        .init(name: "ITER", description: "International Thermonuclear Experimental Reactor"),
        .init(name: "JET", description: "Joint European Torus"),
        .init(name: "Tokamak", description: "High Temperature Superconducting Magnets"),
        .init(name: "KSTAR", description: "Korean Superconducting Tokamak Reactor")
    ]
}

```

* Modify ContentView as follows

```
struct ContentView: View {
    @State private var path = NavigationPath()
    var body: some View {
        NavigationStack(path: $path) {
            List {
                Section("Engines") {
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
                
                Section("Reactors") {
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
                VStack {
                    Text(reactor.name)
                        .font(.headline)
                    
                    Button("Go Home") {
                        path.removeLast(path.count)
                    }
                    
                    Button("Go to Engine Room") {
                        path.append(Engine.samples[0])
                    }
                }
            }
        }
    }
}
```
