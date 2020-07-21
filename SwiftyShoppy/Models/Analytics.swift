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
    public var income: [String: Double]?
    
    ///
    /// Summary
    ///
    public var totalRevenue: Double?
    public var totalOrders: Double?
    public var todaysRevenue: Double?
    
    ///
    /// Gateway
    ///
    public var gateways: [String?: Double?]?
    
    ///
    /// Conversion
    ///
    public var conversion: Double?
}
