//
//  Agent.swift
//  SwiftyShoppy
//
//  Created by Victor Lourme on 02/07/2020.
//

import Foundation

///
/// Agent Data
///
public struct Agent: Codable {
    ///
    /// Public Initializer
    ///
    public init() {}
    
    ///
    /// Content
    ///
    public var geo: Geo?
    public var data: Platform?
}

///
/// Geo data
///
public struct Geo: Codable {
    ///
    /// Public Initializer
    ///
    public init() {}
    
    ///
    /// Content
    ///
    public var ip: String?
    public var iso_code: String?
    public var country: String?
    public var city: String?
    public var state: String?
    public var state_name: String?
    public var postal_code: String?
    public var lat: Float?
    public var lon: Float?
    public var timezone: String?
    public var continent: String?
    public var currency: String?
    public var `default`: Bool?
}

///
/// Platform Data
///
public struct Platform: Codable {
    ///
    /// Public Initializer
    ///
    public init() {}
    
    ///
    /// Platforms
    ///
    public var is_mobile: Bool?
    public var is_table: Bool?
    public var is_desktop: Bool?
    
    ///
    /// OS
    ///
    public var platform: String?
    
    ///
    /// Browser
    ///
    public var browser: Browser?
    
    // Device is not defined because of
    // type mismatch (name and version is
    // sometimes a string, sometimes a bool)
}

///
/// Browser
///
public struct Browser: Codable {
    public var name: String?
    public var version: String?
}
