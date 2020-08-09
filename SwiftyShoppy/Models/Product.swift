//
//  Product.swift
//  SwiftyShoppy
//
//  Created by Victor Lourme on 30/06/2020.
//  Copyright © 2020 Victor Lourme. All rights reserved.
//

import Foundation

///
/// Product model
///
public struct Product: Codable, Equatable, Identifiable {
    ///
    /// Public Initializer
    ///
    public init() {}
    
    ///
    /// Equatable
    ///
    public static func == (lhs: Product, rhs: Product) -> Bool {
        return lhs.id == rhs.id
    }
    
    ///
    /// Model
    /// Note: this key is ignored in GET methods
    ///
    public var model: String? = "Product"
    
    ///
    /// Identifiers
    ///
    public var id: String?
    
    ///
    /// Information
    ///
    public var title: String?
    public var description: String?
    public var image: Image?
    public var unlisted: Bool? = false
    public var type: DeliveryType?
    public var price: Double?
    public var currency: String? = "EUR"
    public var email: Email? = Email()
    public var webhook_urls: [String?]?
    
    ///
    /// Delivery data
    ///
    public var attachment_id: String?
    public var dynamic_url: String?
    public var accounts: [Account?]?
    
    ///
    /// Stock management
    ///
    public var stock: MetadataType?
    public var stock_warning: Int? = 0
    public var quantity: Quantity? = Quantity()
    
    ///
    /// Payment
    ///
    public var confirmations: Int?
    public var gateways: [Gateways]?
    
    ///
    /// Date
    ///
    public var created_at: Date?
    public var updated_at: Date?
}

///
/// Image model
///
public struct Image: Codable {
    ///
    /// Public Initializer
    ///
    public init() {}
    
    public var url: String?
    public var path: String?
}

///
/// Email model
///
public struct Email: Codable {
    ///
    /// Public Initializer
    ///
    public init() {}
    
    public var enabled: Bool? = false
    public var value: String?
}

///
/// Quantity model
///
public struct Quantity: Codable {
    ///
    /// Public Initializer
    ///
    public init() {}
    
    public var min: Int? = 1
    public var max: Int? = 10000
}
