//
//  Endpoints.swift
//  SwiftyShoppy
//
//  Created by Victor Lourme on 29/06/2020.
//  Copyright © 2020 Victor Lourme. All rights reserved.
//

import Foundation

public enum Shoppy {
    ///
    /// Get settings (and user profile) from the private API
    /// (username, email, profile picture, crypto-wallet addresses, etc.)
    ///
    case getSettings
    
    ///
    /// Get analytics from the private API
    /// (amount of orders, income per day, etc.)
    ///
    case getAnalytics
    
    ///
    /// Get metrics from the private API
    /// (total revenues, order per day, etc.)
    ///
    case getMetrics(_ type: MetricType, range: Int)
    
    ///
    /// Get list of orders (25 per page)
    ///
    case getOrders(_ page: Int = 1)
    
    ///
    /// Get a specific order per its identifier
    ///
    case getOrder(_ id: String)
    
    ///
    /// Get list of products (25 per page)
    ///
    case getProducts(_ page: Int = 1)
    
    ///
    /// Get a specific product per its identifier
    ///
    case getProduct(_ id: String)
    
    ///
    /// Create a product using Product model
    ///
    case createProduct(_ product: Product)
    
    ///
    /// Update a product using Product model
    ///
    case updateProduct(_ product: Product)
    
    ///
    /// Delete a product by its identifier
    ///
    case deleteProduct(_ id: String)
    
    ///
    /// Upload a image as Data() to a product by its ID
    ///
    case uploadProductImage(_ id: String, image: Data)
    
    ///
    /// Remove a product image by its ID
    ///
    case deleteProductImage(_ id: String)
    
    
    ///
    /// Get list of queries by page
    ///
    case getQueries(_ page: Int = 1)
    
    ///
    /// Get a specific query by its ID
    ///
    case getQuery(_ id: String)
}
