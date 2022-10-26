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

### Step 2 - - Navigation Path and Programmatic Navigation
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
