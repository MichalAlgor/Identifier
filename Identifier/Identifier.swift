//
//  Identifier.swift
//  Identifier
//
//  Created by Michal Czupryna on 27/02/2019.
//  Copyright © 2019 Michal Czupryna. All rights reserved.
//

import Foundation

public protocol Identifiable: Equatable {
	associatedtype RawIdentifier: Codable & Equatable = String

	var id: Identifier<Self> { get }
}

public struct Identifier<Value: Identifiable> {
	let rawValue: Value.RawIdentifier

	init(rawValue: Value.RawIdentifier) {
		self.rawValue = rawValue
	}
}

extension Identifier: ExpressibleByIntegerLiteral where Value.RawIdentifier == Int {
	public typealias IntegerLiteralType = Int

	public init(integerLiteral value: Int) {
		rawValue = value
	}
}

extension Identifier where Value.RawIdentifier == String {
	init(from decoder: Decoder) throws {
		let container = try decoder.singleValueContainer()
		rawValue = try container.decode(String.self)
	}

	func encode(to encoder: Encoder) throws {
		var container = encoder.singleValueContainer()
		try container.encode(rawValue)
	}
}

extension Identifier where Value.RawIdentifier == Int {
	init(from decoder: Decoder) throws {
		let container = try decoder.singleValueContainer()
		rawValue = try container.decode(Int.self)
	}

	func encode(to encoder: Encoder) throws {
		var container = encoder.singleValueContainer()
		try container.encode(rawValue)
	}
}

extension Identifier: Codable where Value.RawIdentifier == UUID {
	public init(from decoder: Decoder) throws {
		let container = try decoder.singleValueContainer()
		let uuidString = try container.decode(String.self)
		guard let uuid = UUID(uuidString: uuidString) else {
			throw DecodingError.typeMismatch(UUID.self, .init(codingPath: [], debugDescription: "Cannot create UUID from string"))
		}
		rawValue = uuid
	}

	public func encode(to encoder: Encoder) throws {
		var container = encoder.singleValueContainer()
		try container.encode(rawValue)
	}
}

extension Identifier: Equatable { }
