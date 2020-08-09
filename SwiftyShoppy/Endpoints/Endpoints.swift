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
    /// Get public profile
    /// - parameters:
    ///     - username: Username of the profile (@profile)
    ///
    case getProfile(_ username: String)
    
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
    /// - parameters:
    ///     - type: Type of metrics needed
    ///     - range: Range in days
    ///
    case getMetrics(_ type: MetricType, range: Int)
    
    ///
    /// Get list of orders (25 per page)
    /// - parameters:
    ///     - page: Pagination, defaults to 1
    ///
    case getOrders(_ page: Int = 1)
    
    ///
    /// Get a specific order per its identifier
    /// - parameters:
    ///     - id: Order identifier (similar to UUID)
    ///
    case getOrder(_ id: String)
    
    ///
    /// Get list of products (25 per page)
    /// - parameters:
    ///     - page: Pagination, defaults to 1
    ///
    case getProducts(_ page: Int = 1)
    
    ///
    /// Get a specific product per its identifier
    /// - parameters:
    ///     - id: Product Identifier
    ///
    case getProduct(_ id: String)
    
    ///
    /// Create a product using Product model
    /// - parameters:
    ///     - product: Product object completed
    ///
    case createProduct(_ product: Product)
    
    ///
    /// Update a product using Product model
    /// - parameters:
    ///     - product: Product object that already exist but edited
    ///
    case updateProduct(_ product: Product)
    
    ///
    /// Delete a product by its identifier
    /// - parameters:
    ///     - id: Product identifier
    ///
    case deleteProduct(_ id: String)
    
    ///
    /// Upload a image as Data() to a product by its ID
    /// - parameters:
    ///     - id: Product identifier
    ///     - image: Image as Data
    ///
    case uploadProductImage(_ id: String, image: Data)
    
    ///
    /// Remove a product image by its ID
    /// - parameters:
    ///     - id: Product identifier
    ///
    case deleteProductImage(_ id: String)
    
    ///
    /// Get list of queries by page
    /// - parameters:
    ///     - page: Pagination, defaults to 1
    ///
    case getQueries(_ page: Int = 1)
    
    ///
    /// Get a specific query by its ID
    /// - parameters: Query identifier
    ///
    case getQuery(_ id: String)
    
    ///
    /// Reply to a query by its ID
    /// - parameters:
    ///     - id: Query identifier
    ///     - message: Message as String (maximum 255 chars)
    ///
    case replyToQuery(_ id: String, message: String)
    
    ///
    /// Update a query by doing an action (open or close)
    /// - parameters:
    ///     - id: Query identifier
    ///     - action: Action to execute (re-open or close)
    ///
    case updateQuery(_ id: String, action: QueryAction)
    
    ///
    /// Get every attachments of the account
    ///
    case getAttachments
    
    ///
    /// Get every feedbacks
    /// - parameters:
    ///     - page: Pagination, defaults to 1
    ///
    case getFeedbacks(_ page: Int = 1)
    
    ///
    /// Get a feedback by ID
    /// - parameters:
    ///     - id: Feedback identifier
    ///
    case getFeedback(_ id: String)
}
