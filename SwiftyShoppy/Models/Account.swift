//
//  Account.swift
//  SwiftyShoppy
//
//  Created by Victor Lourme on 09/07/2020.
//

import Foundation

///
/// Account handler
/// - When getting Product, it will return a array of objects
/// - When updating or creating a Product, we need to send a array of Strings
///
public enum Account: Codable, Hashable {
    case account(String)
    
    ///
    /// Decode using JSON Decoder
    ///
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        
        do {
            self = try .account(container.decode(String.self))
        } catch DecodingError.typeMismatch {
            self = try .account(container.decode(AccountGet.self).account ?? "")
        }
    }
    
    ///
    /// Encode to JSON
    ///
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .account(let string):
            try container.encode(string)
        }
    }
    
    ///
    /// Get the associated number
    ///
    public func get() -> String {
        switch self {
        case let .account(string):
            return string
        }
    }
}

///
/// Account Getter for array of objects
///
public struct AccountGet: Codable {
    public var account: String?
}
