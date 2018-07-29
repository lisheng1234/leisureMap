//
//  leisureMapTests.swift
//  leisureMapTests
//
//  Created by stu1 on 2018/7/23.
//  Copyright © 2018年 stu1. All rights reserved.
//

import XCTest
@testable import leisureMap

class leisureMapTests: XCTestCase {

    var sqliteWorker : SQLiteWorker?
    

    
    
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
        sqliteWorker = SQLiteWorker()
        sqliteWorker?.createDatabase()
    
    }

    override func tearDown() {
        super.tearDown()
        sqliteWorker?.clearAll()
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
