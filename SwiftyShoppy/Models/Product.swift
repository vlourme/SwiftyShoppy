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
public struct Product: Codable {
    ///
    /// Public Initializer
    ///
    public init() {}
    
    ///
    /// Model
    /// Note: this key is ignored in GET methods
    ///
    public var model: String? = "Product"
    
    ///
    /// Identifiers
    ///
    public var id: String?
    public var attachment_id: String?
    
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
    
    ///
    /// Stock management
    ///
    public var stock: Int?
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
    
    ///
    /// CodingKeys to escape stock error
    ///
    private enum CodingKeys: String, CodingKey {
        case id, attachment_id, title, description,
            image, unlisted, type, price, currency, email,
            stock, stock_warning, quantity, confirmations, gateways,
            created_at, updated_at
    }
    
    ///
    /// Init
    ///
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        // Decode type mismatch
        do {
            self.stock = try container.decode(Int.self, forKey: .stock)
        } catch DecodingError.typeMismatch {
            self.stock = Int(try container.decode(String.self, forKey: .stock))
        }
        
        // Decode other things
        // TODO: This is redundant
        do {
            self.id = try container.decode(String?.self, forKey: .id)
            self.attachment_id = try container.decode(String?.self, forKey: .attachment_id)
            self.title = try container.decode(String?.self, forKey: .title)
            self.description = try container.decode(String?.self, forKey: .description)
            self.image = try container.decode(Image?.self, forKey: .image)
            self.unlisted = try container.decode(Bool?.self, forKey: .unlisted)
            self.type = try container.decode(DeliveryType?.self, forKey: .type)
            self.price = try container.decode(Double?.self, forKey: .price)
            self.currency = try container.decode(String?.self, forKey: .currency)
            self.email = try container.decode(Email?.self, forKey: .email)
            self.stock_warning = try container.decode(Int?.self, forKey: .stock_warning)
            self.quantity = try container.decode(Quantity?.self, forKey: .quantity)
            self.confirmations = try container.decode(Int?.self, forKey: .confirmations)
            self.gateways = try container.decode([Gateways]?.self, forKey: .gateways)
            self.created_at = try container.decode(Date?.self, forKey: .created_at)
            self.updated_at = try container.decode(Date?.self, forKey: .updated_at)
        } catch {
            // Ignore
        }
        
    }
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

///
/// Updated product
/// Note: Use this struct to parse created and updated products
///
public struct UpdatedProduct: Codable {
    ///
    /// Public Initializer
    ///
    public init() {}
    
    ///
    /// Status
    ///
    public var status: Bool?
    public var message: String?
    
    ///
    /// Content
    ///
    public var resource: Product?
}
