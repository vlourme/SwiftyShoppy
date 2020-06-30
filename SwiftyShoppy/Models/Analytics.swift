//
//  Analytics.swift
//  SwiftyShoppy
//
//  Created by Victor Lourme on 30/06/2020.
//

public struct Analytics: Codable {
    ///
    /// Identifiers
    ///
    var status: Bool?
    var cached_at: String?
    
    ///
    /// Incomes
    ///
    var income: [String: Int]?
    
    ///
    /// Summary
    ///
    var totalRevenue: Int?
    var totalOrders: Int?
    var todaysRevenue: Int?
    
    ///
    /// Gateway
    ///
    var gateways: [String: Int]?
    
    ///
    /// Conversion
    ///
    var conversion: Int?
}
