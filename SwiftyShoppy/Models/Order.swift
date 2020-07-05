//
//  Order.swift
//  SwiftyShoppy
//
//  Created by Victor Lourme on 29/06/2020.
//  Copyright © 2020 Victor Lourme. All rights reserved.
//

import Foundation

///
/// Order structure
///
public struct Order: Codable {
    ///
    /// Public Initializer
    ///
    public init() {}
    
    ///
    /// Identifiers
    ///
    public var id: String?
    public var pay_id: String?
    public var product_id: String?
    public var coupon_id: String?
    
    ///
    /// Order information
    ///
    public var price: Double?
    public var currency: String?
    public var delivered: Int?
    public var confirmations: Int?
    public var required_confirmations: Int?
    public var custom_fields: [CustomField]?
    
    ///
    /// Buyer
    ///
    public var email: String?
    public var crypto_address: String?
    public var crypto_amount: String?
    public var quantity: Int?
    public var exchange: String?
    public var gateway: Gateways.RawValue?
    
    ///
    /// Date
    ///
    public var paid_at: Date?
    public var created_at: Date?
    
    ///
    /// Data delivered
    ///
    public var accounts: [Account]?
    
    ///
    /// Replacement
    ///
    public var is_replacement: Bool?
    public var replacement_id: String?
    
    ///
    /// Product
    ///
    public var product: Product?
    
    ///
    /// Agent
    ///
    public var agent: Agent?
    
    ///
    ///
    /// Hash
    public var hash: String?
}

///
/// Custom Field
///
public struct CustomField: Codable {
    ///
    /// Public Initializer
    ///
    public init() {}
    
    public var name: String?
    public var type: String?
    public var required: Bool?
    public var value: String?
}

///
/// Account
///
public struct Account: Codable {
    ///
    /// Public Initializer
    ///
    public init() {}
    
    public var account: String?
}
