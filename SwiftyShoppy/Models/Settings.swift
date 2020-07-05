//
//  Settings.swift
//  SwiftyShoppy
//
//  Created by Victor Lourme on 04/07/2020.
//

import Foundation

///
/// Settings
///
public struct Settings: Codable {
    ///
    /// Public Initializer
    ///
    public init() {}
    
    ///
    /// Status
    ///
    public var status: Bool?
    
    ///
    /// User
    ///
    public var user: User?
    
    ///
    /// Settings
    ///
    public var settings: SettingsContainer?
}

///
/// User
///
public struct User: Codable {
    ///
    /// Public Initializer
    ///
    public init() {}
    
    ///
    /// User data
    ///
    public var username: String?
    public var email: String?
}

///
/// Settings
///
public struct SettingsContainer: Codable {
    ///
    /// Public Initializer
    ///
    public init() {}
    
    ///
    /// Avatar
    ///
    public var userAvatar: String?
    public var userAvatarURL: String?
    
    ///
    /// Currencies and gateways
    ///
    public var currency: String?
    public var bitcoinAddress: String?
    public var litecoinAddress: String?
    public var ethereumAddress: String?
    public var paypalAddress: String?
    public var stripeAccountId: String?
    public var stripeConnected: Bool?
}
