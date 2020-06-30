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
struct Product: Codable {
    ///
    /// Identifiers
    ///
    var id: String?
    var attachment_id: String?
    
    ///
    /// Information
    ///
    var title: String?
    var description: String?
    var image: Image?
    var unlisted: Bool?
    var type: String?
    var price: Double?
    var currency: String?
    var email: Email?
    
    ///
    /// Stock management
    ///
    var stock: Int?
    var stock_warning: Int?
    var quantity: Quantity?
    
    ///
    /// Payment
    ///
    var confirmations: Int?
    var gateways: [String]?
    
    ///
    /// Date
    /// TODO: Parse correctly
    ///
    var created_at: Date?
    var updated_at: Date?
}

///
/// Image model
///
struct Image: Codable {
    var url: String?
    var path: String?
}

///
/// Email model
///
struct Email: Codable {
    var enabled: Bool?
    var value: String?
}

///
/// Quantity model
///
struct Quantity: Codable {
    var min: Int?
    var max: Int?
}
