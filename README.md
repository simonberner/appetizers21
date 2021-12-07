# Appetizers21
Appetizers21 is a take-home project to practice and learn iOS development. Learning how to fetch JSON data, caching, showing alerts
is the main goal of this App.

## App Store
This App is not available on the App Store.

## Used Technologies
- Swift 5.5
- SwiftUI
- Codable
- JSON
- Combine (for getting JSON data)
### SwiftUI
- Form, Section
- ProgressView
- TabView
- Toggle

## Learnings
### General
- We don't need [Almofire](https://github.com/Alamofire/Alamofire) to make basic network calls
- For creating a loading view with a spinner we now can use the ProgessView() struct in SwiftUI
- A [Gaussian Blur](https://en.wikipedia.org/wiki/Gaussian_blur) can be added to any SwiftUI View with .blur()
- A List can be disabled with .disabled()
- Put the @State vars as @Published into the ViewModel
- [@ObservedObject vs @StateObject](https://medium.com/swlh/understanding-stateobject-in-swiftui-for-ios-14-98c68310154a)
- @StateObject property wrapper persists the value during the rendering of the view
- [Reducers](https://www.hackingwithswift.com/example-code/language/how-to-use-reduce-to-condense-an-array-into-a-single-value) let us reduce values into a single one
### SwiftUI
- Whenever we want to update a view, we need some @State
- [Alerts in iOS15](https://www.hackingwithswift.com/quick-start/swiftui/how-to-show-an-alert)
- @AppStorage is SwiftUI's way of interacting with UserDefaults. It will watch an item in UserDefaults and when that changes
it behaves like a state variable and triggers an UI update.
- [@AppStorage has also its downsides](https://www.avanderlee.com/swift/appstorage-explained/)
### UserDefaults
- Shall ONLY be used for storing some lightweight user preferences! 
- Gets deleted when the App is deleted! So don't save any user critical data in there!
### NSPredicate
- [A Predicate is a filter](https://www.hackingwithswift.com/read/38/7/examples-of-using-nspredicate-to-filter-nsfetchrequest)
- [Core Data String Queries using NSPredicate](https://www.advancedswift.com/core-data-string-query-examples-in-swift/)
- [PredicateKit](https://github.com/ftchirou/PredicateKit)

## Code comments
For learning purposes, I have added lots of comments alongside the code. I know that this would propably be ommitted in 'production' code ;)

## Credits
Thanks to Sean Allen for an amazingly well structured and tought SwiftUI Fundamentals course!
