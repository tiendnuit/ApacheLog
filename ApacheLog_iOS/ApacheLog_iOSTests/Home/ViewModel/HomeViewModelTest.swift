//
//  HomeViewModelTest.swift
//  ApacheLog_iOSTests
//
//  Created by Scor Doan on 11/03/2021.
//

import XCTest
@testable import ApacheLog_iOS

class HomeViewModelTest: XCTestCase {
    var viewModel: HomeViewModel!
    
    override func setUp() {
        viewModel = HomeViewModel()
    }
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_getMostCommonSequence() throws {
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
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
