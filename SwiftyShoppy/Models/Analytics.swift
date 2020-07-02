//
//  Analytics.swift
//  SwiftyShoppy
//
//  Created by Victor Lourme on 30/06/2020.
//

public struct Analytics: Codable {
    ///
    /// Public Initializer
    ///
    public init() {}
    
    ///
    /// Identifiers
    ///
    public var status: Bool?
    public var cached_at: String?
    
    ///
    /// Incomes
    ///
    public var income: [String: Int]?
    
    ///
    /// Summary
    ///
    public var totalRevenue: Int?
    public var totalOrders: Int?
    public var todaysRevenue: Int?
    
    ///
    /// Gateway
    ///
    public var gateways: [String: Int]?
    
    ///
    /// Conversion
    ///
    public var conversion: Int?
}
