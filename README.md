# Rick & Morty iOS App

## Assignment
This app is based on an assignment from AckeeCZ -> [GitHub Repository](https://github.com/AckeeCZ/ios-task-rick-and-morty?tab=readme-ov-file). Feel free to use it as inspiration for any project! 😊

### Requirements

- [x] The app must be written in Swift.  
- [x] Define the UI of the app however you like (we've heard SwiftUI is the new cool thing now 😎).  
- [x] Use any asynchronous framework you fancy, such as Combine, ReactiveSwift, or native async/await.  
- [x] Follow the MVVM architecture or Composable architecture.  
- [x] Ensure the app adheres to the system's Dark Mode settings.  
- [x] The application should run on all devices and orientations (note: we don’t have separate designs for tablets).  
- [ ] Use third-party libraries, technologies, and frameworks as needed—but have a solid reason for including any of them.  
- [x] Feel free to add any extra features! (Psst, we ❤️ testing.)  
- [ ] Submit your work as a link to your Git repository containing the source code.  

### Additional Tasks

- [x] Localized strings – could be useful on other planets! 🪐
- [x] Cached images.  
- [x] Save characters to favorites (not just their IDs) – Now available offline (favorites page only).  
- [x] Error handling with `Retry` enabled.  
- [x] MVVM-R (MVVM enhanced with a Router).  
- [x] Display all data for an empty search (maybe a bug, maybe a feature 😄 – can be easily fixed in `TableView` based on `isSearching`).  
- [x] Design supporting iPads and iPhone landscape – small rearrangements in the Character Detail view.  
- [x] Unit tests for Utils and an example of testing the Rick & Morty API service with mocked data.  
- [x] Swiftlint for check code style
- [x] Design structure base on [Atomic desing](https://atomicdesign.bradfrost.com/chapter-2/) for easy reuse in another part of app

### Bugs in Figma
- Different colors between dark and light modes – The app changes colors based on the color scheme.  
- Incorrect value in the dark color `backgroundsBottomNavigation` – The app uses the value from Figma, not from the string.  
