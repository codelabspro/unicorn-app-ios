# unicorn-app-ios
unicorn-app-ios


## Steps
  



```
struct ContentView: View {
  var body: some View {
    
    List {
      NavigationLink("PAYLOAD", value: "payload value")
      
    
    }
    .navigationDestination(for: String.self) { string in
      Text(string)
        .foregroundColor(.blue)
    }
  }

}

```
