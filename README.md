# NYTimesApp
NYTimes most viewed articles master-detail app.

# Built using:
  - Xcode 10.1
  - Swift version 4.2
  - Pods (Alamofire, KingFisher, SwiftLint)

# Technical Notes:
  - Used MVC because the task is too simple.
  - UI is built using storyboard & xib files.
  - Tried to build the UI simple as possible, to only achieve the functionality without any issues.
  - Added simple UI component from code 'Activity Indicator' with constraints.
  - Used Alamofire for handling the API call, I tried to not over-engineering the network layer. (URLSession is another option and simpler)
  - Using Codable for parsing the JSON response and mapping it to the model.
  - Used the KingFisher Pod for async fetching and caching images.
  - Tried to respect the git-flow main guidelines.
  - Didn't handle the no internet connection or service call failure.
  - Using SwiftLint for linting the code.
  - Simple Unit/UI tests implemented.
  - The UI tests depend on specific article title retrived from the API & because of the response changes the UI tests should be updated to valid article title when testing the project.
  - The coverage test result = 97.0%.
  - No Fastlane provided.
  - No SonarQube reports provided.
  - The Listing service has a static period of 7.
  
# General Notes:
  - please consider that the time is so limited.
  

I hope this task achieve your satisfaction, and waiting to discuss when possible.
If there is any comment on the task I would be happy to hear it.
