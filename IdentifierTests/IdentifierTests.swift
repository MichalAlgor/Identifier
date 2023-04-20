//
//  IdentifierTests.swift
//  IdentifierTests
//
//  Created by Michal Czupryna on 27/02/2019.
//  Copyright © 2019 Michal Czupryna. All rights reserved.
//

import XCTest
@testable import Identifier

class IdentifierTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testUUIDIdentifier() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
		struct TestStruct: Identifiable, Codable {
			typealias RawIdentifier = Int
			let id: Identifier<TestStruct>

		}

		let id = Identifier<TestStruct>(rawValue: 10)
		let test = TestStruct(id: id)

		XCTAssertNotNil(test, "Should create object")

		let encoder = JSONEncoder()
		let data = try encoder.encode(test)
		print(String(decoding: data, as: UTF8.self))
		XCTAssertNotNil(data, "Should encode test struct")
		let decoder = JSONDecoder()
		let testFromJson = try decoder.decode(TestStruct.self, from: data)
		XCTAssertEqual(test, testFromJson, "Should be the same objects")
    }

//	func testIntIdentifier() throws {
//		// This is an example of a functional test case.
//		// Use XCTAssert and related functions to verify your tests produce the correct results.
//		struct TestStruct: Identifiable, Codable {
//			typealias RawIdentifier = Int
//			let id: Identifier<TestStruct>
//		}
//
//		let id = Identifier<TestStruct>(rawValue: 10)
//		let test = TestStruct(id: id)
//
//		XCTAssertNotNil(test, "Should create object")
//
//		let encoder = JSONEncoder()
//		let data = try encoder.encode(test)
//		print(String(decoding: data, as: UTF8.self))
//		XCTAssertNotNil(data, "Should encode test struct")
//		let decoder = JSONDecoder()
//		let testFromJson = try decoder.decode(TestStruct.self, from: data)
//		XCTAssertEqual(test, testFromJson, "Should be the same objects")
//	}

//	func testStringIdentifier() throws {
//		// This is an example of a functional test case.
//		// Use XCTAssert and related functions to verify your tests produce the correct results.
//		struct TestStruct: Identifiable, Codable {
//			typealias RawIdentifier = String
//			let id: Identifier<TestStruct>
//		}
//
//		let id = Identifier<TestStruct>(rawValue: "Identifier")
//		let test = TestStruct(id: id)
//
//		XCTAssertNotNil(test, "Should create object")
//
//		let encoder = JSONEncoder()
//		let data = try encoder.encode(test)
//		print(String(decoding: data, as: UTF8.self))
//		XCTAssertNotNil(data, "Should encode test struct")
//		let decoder = JSONDecoder()
//		let testFromJson = try decoder.decode(TestStruct.self, from: data)
//		XCTAssertEqual(test, testFromJson, "Should be the same objects")
//	}
//
//	func testCustomIdentifier() throws {
//		// This is an example of a functional test case.
//		// Use XCTAssert and related functions to verify your tests produce the correct results.
//		struct CustomId: Equatable, Codable {
//			let value: String
//		}
//		struct TestStruct: Identifiable, Codable {
//			typealias RawIdentifier = CustomId
//			let id: Identifier<TestStruct>
//		}
//
//		let id = Identifier<TestStruct>(rawValue: CustomId(value: "Id"))
//		let test = TestStruct(id: id)
//
//		XCTAssertNotNil(test, "Should create object")
//
//		let encoder = JSONEncoder()
//		let data = try encoder.encode(test)
//		print(String(decoding: data, as: UTF8.self))
//		XCTAssertNotNil(data, "Should encode test struct")
//		let decoder = JSONDecoder()
//		let testFromJson = try decoder.decode(TestStruct.self, from: data)
//		XCTAssertEqual(test, testFromJson, "Should be the same objects")
//	}
}
