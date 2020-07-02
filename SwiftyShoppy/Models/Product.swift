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
    public var unlisted: Bool?
    public var type: String?
    public var price: Double?
    public var currency: String?
    public var email: Email?
    
    ///
    /// Stock management
    ///
    public var stock: Int?
    public var stock_warning: Int?
    public var quantity: Quantity?
    
    ///
    /// Payment
    ///
    public var confirmations: Int?
    public var gateways: [String]?
    
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
            self.type = try container.decode(String?.self, forKey: .type)
            self.price = try container.decode(Double?.self, forKey: .price)
            self.currency = try container.decode(String?.self, forKey: .currency)
            self.email = try container.decode(Email?.self, forKey: .email)
            self.stock_warning = try container.decode(Int?.self, forKey: .stock_warning)
            self.quantity = try container.decode(Quantity?.self, forKey: .quantity)
            self.confirmations = try container.decode(Int?.self, forKey: .confirmations)
            self.gateways = try container.decode([String]?.self, forKey: .gateways)
            self.created_at = try container.decode(Date?.self, forKey: .created_at)
            self.updated_at = try container.decode(Date?.self, forKey: .updated_at)
        } catch let error {
            print(error)
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
    
    public var enabled: Bool?
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
    
    public var min: Int?
    public var max: Int?
}
