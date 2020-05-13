//
//  InterviewStoryboardTests.swift
//  InterviewStoryboardTests
//
//  Created by Yohann Melo on 2020-02-13.
//  Copyright © 2020 Yohann Melo. All rights reserved.
//

import XCTest
@testable import InterviewStoryboard

class InterviewStoryboardTests: XCTestCase {

    let mockedData = MockedData()

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCanGetCurrentUser() {
        if let user = mockedData.currentUser() {
            XCTAssert(!user.isEmpty, "current user has no data")
        } else {
            XCTFail()
        }
    }
    
    func testCanDecodeCurrentUserToUserObject() {
        if let user = mockedData.currentUser() {
            let jsonData = user.data(using: .utf8)!
            let decoder = JSONDecoder()
            do {
                let currentUserObject = try decoder.decode(User.self, from: jsonData)
                XCTAssert(!currentUserObject.name.isEmpty, "User name is empty where a value was expected")
                XCTAssert(!currentUserObject.profilePicture.isEmpty, "Decoded user has no profile picture")
            } catch {
                XCTFail("Error decoding current user: \(error)")
            }
        } else {
            XCTFail("Attempt to get current user returned nil")
        }
    }
    
}
