# Appetizers21
Appetizers21 is a take-home project to practice and learn iOS development. Learning how to fetch JSON data, caching, showing alerts
is the main goal of this App.

## Screens
![Home](appetizers21-home.png)
![Home](appetizers21-account.png)
![Home](appetizers21-order.png)

## App Store
This App is not available on the App Store.

## Used Technologies
- Swift 5.5
- SwiftUI
- Codable
- JSON
- Combine (for getting JSON data)
- XCTest
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
- [Trainling clousure syntax can be used, when a closure is the last parameter in a function](https://www.hackingwithswift.com/example-code/language/what-is-trailing-closure-syntax)
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
### NEW async/await (introduced at WWDC21)
- A lot of stuff gets abstracted away with async/await (not necessarly having less lines of code):
	- putting manually things onto the main queue/thread explicitly
	- completion handler handeling all the exists
	- doing the weak self dance
- [Is a welcome change on the testing side of the codebase!](https://mokacoding.com/blog/how-to-test-async-await-code-in-swift/)
### AsyncImage
- [A simple way to download and render a remote image from a URL](https://wwdcbysundell.com/2021/using-swiftui-async-image/)
- Pros: easy way to asynchronously load and display an Image
- Cons: offers no cachihg of already loaded Images!
### Writing Unit-Tests
- [Unit tests best practices in Xcode and Swift](https://www.avanderlee.com/swift/unit-tests-best-practices/)
- [Getting started with Unit-Testing](https://www.youtube.com/watch?v=F5aDfGNdsac)
## Code comments
For learning purposes, I have added lots of comments alongside the code. I know that this would propably be ommitted in 'production' code ;)

## Testing with XCTest/XCUITest
As a Tester I have the natural intrinsic  behavior of adding some Tests to my own written code. From my point of view it does not matter wether one does that
in a TDD or 'after the code is written' fashion. As an automation engineer coming from the Selenium/Appium automation world, I am impressed how
fast the UI Test run on a Simulator with XCTest.
So in this project I have for the very first time in my life ever, written some Unit- and UI-Tests with pure XCTest. Have a look and enjoy! (More to come)

## Credits
Thanks to Sean Allen for an amazingly well structured and tought SwiftUI Fundamentals course!
