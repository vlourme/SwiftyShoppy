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
struct Order: Codable {
    ///
    /// Identifiers
    ///
    var id: String?
    var pay_id: String?
    var product_id: String?
    var coupon_id: String?
    
    ///
    /// Order information
    ///
    var price: Double?
    var currency: String?
    var delivered: Int?
    var confirmations: Int?
    var required_confirmations: Int?
    var custom_fields: [CustomField]?
    
    ///
    /// Buyer
    ///
    var email: String?
    var crypto_address: String?
    var crypto_amount: String?
    var quantity: Int?
    var exchange: String?
    
    ///
    /// Date
    ///
    var paid_at: Date?
    var created_at: Date?
    
    ///
    /// Data delivered
    ///
    var accounts: [Account]?
    
    ///
    /// Replacement
    ///
    var is_replacement: Bool?
    var replacement_id: String?
    
    ///
    /// Product
    ///
    var product: Product?
}

///
/// Custom Field
///
struct CustomField: Codable {
    var name: String
    var type: String
    var required: Bool
    var value: String?
}

///
/// Account
///
struct Account: Codable {
    var account: String
}
