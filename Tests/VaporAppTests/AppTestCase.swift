//
//  AppTestCase.swift
//  VaporAppTests
//
//  Created by عمر سعيد الشمري on 18/06/2020.
//

import XCTVapor


class AppTestCase: XCTestCase {
    var app: Application!

    override func setUpWithError() throws {
        try super.setUpWithError()
        app = try setup(.testing)
    }

    override func tearDownWithError() throws {
        app.shutdown()
        try super.tearDownWithError()
    }
    
    var headers: NIOHTTP1.HTTPHeaders {
        return NIOHTTP1.HTTPHeaders(dictionaryLiteral: ("Content-Type", "application/json"))
    }
}
