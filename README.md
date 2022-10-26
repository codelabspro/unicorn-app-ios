# unicorn-app-ios
unicorn-app-ios


## Steps
  



```
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
