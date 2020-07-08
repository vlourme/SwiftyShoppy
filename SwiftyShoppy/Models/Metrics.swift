//
//  Metrics.swift
//  SwiftyShoppy
//
//  Created by Victor Lourme on 08/07/2020.
//

import Foundation

///
/// Metric types
///
public enum MetricType: String {
    case revenue = "Revenue"
    case ordersPerDay = "OrdersPerDay"
    case orders = "Orders"
    case totalOrder = "TotalOrders"
}

///
/// Metric
///
public struct Metrics: Codable {
    ///
    /// Public Initializer
    ///
    public init() {}
    
    ///
    /// Ranges
    ///
    public var ranges: [String: String]?
    
    ///
    /// Values
    ///
    public var value: MetricsValue?
}

///
/// Metrics values
/// Note: Previous, PreviousLabel and Suffix are not included
///         because it can't be tested yet.
///
public struct MetricsValue: Codable {
    ///
    /// Public Initializer
    ///
    public init() {}
    
    ///
    /// Value
    ///
    public var value: Double?
    
    ///
    /// Prefix (e.g.: currency symbol)
    ///
    public var prefix: String?
}
