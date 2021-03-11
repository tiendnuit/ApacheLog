# Apache Logs!

An example of MVVM-C + POP + UIKit + Combine show most common three-page sequences in the Apache web server access log file.


# Key Features
-  Using **Swift** + **MVVM-C** + **UIKit** + **Combine** + **POP**
-  Show most common three-page sequences in the Apache web server access log file.
-  Make UI with programmatically.
-  Light & dark mode compatible.
-  No third-party libraries.
-  Unit test


## Requirements
-   iOS 13.0+
-   Xcode 12.2

## Architecture
Using MVVM-C pattern gives us some benefits like code reuse, ease of testing, bindings make UI updates easier to handle, ease of maintainability.

And splitting off protocols (DataSource and Delegate) into separate objects we can re-use those objects in other view controllers, or use different objects in the same view controller to get different behavior at runtime.

## Unit Test

    //Given
        let logInfos = [LogInfo(user: "A", requestedPage: "Page1"),
                        LogInfo(user: "B", requestedPage: "Page1"),
                        LogInfo(user: "B", requestedPage: "Page2"),
                        LogInfo(user: "B", requestedPage: "Page3"),
                        LogInfo(user: "B", requestedPage: "Page2"),
                        LogInfo(user: "A", requestedPage: "Page2"),
                        LogInfo(user: "A", requestedPage: "Page3"),
                        LogInfo(user: "A", requestedPage: "Page4"),
                        LogInfo(user: "A", requestedPage: "Page1"),
                        LogInfo(user: "A", requestedPage: "Page2")]
        let mostCommon = "Page1, Page2, Page3"
        let appearTimes = 2
        
        //Then
        viewModel.processThreePageSequences(logInfos)
        let sequences = viewModel.sequences
        
        //Then
        XCTAssertEqual(sequences.first!.threePage, mostCommon)
        XCTAssertEqual(sequences.first!.frequency, appearTimes)
    
## Next Features
- Make UI with SwiftUI

## Author
Tommy Doan, [tiendnuit@gmail.com](mailto:tiendnuit@gmail.com) or [tommy.doan2710@gmail.com](mailto:tommy.doan2710@gmail.com)
