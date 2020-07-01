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
        case stock
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
        
    }
}

///
/// Image model
///
public struct Image: Codable {
    public var url: String?
    public var path: String?
}

///
/// Email model
///
public struct Email: Codable {
    public var enabled: Bool?
    public var value: String?
}

///
/// Quantity model
///
public struct Quantity: Codable {
    public var min: Int?
    public var max: Int?
}
