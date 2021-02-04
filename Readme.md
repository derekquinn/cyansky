## Cyan Sky
## iOS Weather Application

### Cyan Sky is built using `SwiftUI` and the Model View ViewModel (MVVM) design pattern.  This application was built within the during a 90 minute Spike, as part of a solo Extreme Programming exercise. 

### More on Agile Spikes from [Agile Dictionary](http://agiledictionary.com/)
> The term spike comes from Extreme Programming (XP), where “A spike solution is a very simple program to explore potential solutions.” XP guru Ward Cunningham describes how the term was coined on the C2.com wiki: “I would often ask Kent [Beck], ‘What is the simplest thing we can program that will convince us we are on the right track?’ Such stepping outside the difficulties at hand often led us to simpler and more compelling solutions. Kent dubbed this a Spike. I found the practice particularly useful while maintaining large frameworks.”

## What is MVVM?
The Model View ViewModel design pattern is typical for `SwiftUI` . It is (in some ways) a variation of the MVC pattern used in `UIKit`. MVVM consists of three layers (you gussed it) the Model, View and ViewModel. 

1. Model - Includes domain business logic and Swift types (structs) that correspond to the API. 
  – `Weather.swift` 
1. View - This is where we get to make use of the new `SwiftUI` view. The view is what the user sees. - `WeatherView.swift` In `SwiftUI`, we can define a struct that conforms to `PreviewProvider` to instantly render a preview without running a simulator. This can considerably speed up development time.
1. ViewModel - Serves as a connection between `Weather.swift` and `WeatherView.swift` . Handles all user interaction and contains the current state of the view. 

## State Management in SwiftUI
`SwiftUI` fundamentally differs from Apple's previous frameworks below the hood. Consider how view-level state is governed. For example, a similar iOS applciation like [BlueSky](https://github.com/derekquinn/ios-bluesky) contains delegates & data sources that are common in `UIKit`. Instead, `SwiftUI` contains a score of exciting [property wrappers](https://www.hackingwithswift.com/quick-start/swiftui/all-swiftui-property-wrappers-explained-and-compared). This application employs state management as outlined below.  
- In `WeatherView`, `@ObservedObject` is applied to the `viewModel` to link it to an external class, in this case `WeatherViewModel`.
- `WeatherViewModel` conforms to `ObservableObject`which allows the data to be shared across views. One caveat here is that `WeatherViewModel` has to contain a `class` (`struct` will not work here). 

## A note on (the wonderful) Codable
### Decoding
- Codable is the bridge between JSON and swift.  Say we have JSON coming in from an API representing Weather data. We can convert this JSON into a `struct` by 
defining a `struct` that matches the incoming JSON.  Then, all we need to do is use the `JSONDecoder` to decode the json, which matches the `Weather` type. The 
JSON is **decoded** into a swift construct that we can access within our codebase. This is typically used to GET data from an API. 

### Encoding
- We can go from Swift to JSON by using the `JSONEncoder`. This process is essentially decoding in reverse, as we can go from a `struct` to `JSON`. This is used to send data TO an API using POST or PUT for example. 
