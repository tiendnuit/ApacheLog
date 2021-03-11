//
//  LogSequenceCellViewModelTests.swift
//  ApacheLog_iOSTests
//
//  Created by Scor Doan on 11/03/2021.
//

import XCTest
@testable import ApacheLog_iOS
class LogSequenceCellViewModelTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_threeGroupName() {

        //Given
        let sequence = LogSequence(threePage: "Page 1, Page 2, Page 3")
        
        //When
        let vm = LogSequenceCellViewModel(sequence: sequence, index: 0)

        //Then
        XCTAssert(vm.threeGroupName == sequence.threePage)
    }
    
    func test_frequency() {

        //Given
        let sequence = LogSequence(threePage: "Page 1, Page 2, Page 3", frequency: 10)
        
        //When
        let vm = LogSequenceCellViewModel(sequence: sequence, index: 0)

        //Then
        XCTAssert(vm.frequency == "\(sequence.frequency)")
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
