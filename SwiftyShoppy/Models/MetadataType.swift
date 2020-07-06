//
//  MetadataType.swift
//  SwiftyShoppy
//
//  Created by Victor Lourme on 05/07/2020.
//

import Foundation

///
/// MetadataType parse a Codable value to Int
/// It handle typeMismatch errors to get in any cases a int
///
public enum MetadataType: Codable {
    case int(Int)
    
    ///
    /// Decode using JSON Decoder
    ///
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        do {
            self = try .int(container.decode(Int.self))
        } catch DecodingError.typeMismatch {
            do {
                self = try .int(Int(container.decode(String.self)) ?? -1)
            } catch DecodingError.typeMismatch {
                throw DecodingError.typeMismatch(MetadataType.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Encoded payload not of an expected type"))
            }
        }
    }
    
    ///
    /// Encode to JSON
    ///
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .int(let int):
            try container.encode(int)
        }
    }
    
    ///
    /// Get the associated number
    ///
    public func get() -> Int {
        switch self {
        case let .int(int):
            return int
        }
    }
}
