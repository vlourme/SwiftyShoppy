//
//  Resource.swift
//  SwiftyShoppy
//
//  Created by Victor Lourme on 08/07/2020.
//

import Foundation

///
/// Updated resource (use for .replyToQuery, .createProduct, etc.)
///
public struct ResourceUpdate<Element: Codable>: Codable {
    ///
    /// Public Initializer
    ///
    public init() {}
    
    ///
    /// Status
    ///
    public var status: Bool?
    
    ///
    /// Message
    ///
    public var message: String?
    
    ///
    /// Ressource
    ///
    public var resource: Element?
}
