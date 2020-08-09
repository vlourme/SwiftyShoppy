//
//  Feedback.swift
//  SwiftyShoppy
//
//  Created by Victor Lourme on 21/07/2020.
//

import Foundation

///
/// Feedback
///
public struct Feedback: Codable, Equatable, Identifiable {
    ///
    /// Public Initializer
    ///
    public init() {}
    
    ///
    /// Equatable
    ///
    public static func == (lhs: Feedback, rhs: Feedback) -> Bool {
        return lhs.id == rhs.id
    }
    
    ///
    /// Feedback ID
    ///
    public var id: String?
    
    ///
    /// Associated order ID
    ///
    public var order_id: String?
    
    ///
    /// Message
    ///
    public var comment: String?
    
    ///
    /// Amount of stars
    ///
    public var stars: Int?
    
    ///
    /// Rating
    ///
    public var rating: Int?
    
    ///
    /// Response from the seller
    ///
    public var response: String?
    
    ///
    /// Creation date
    ///
    public var created_at: Date?
    
    ///
    /// Last update date
    ///
    public var updated_at: Date?
    
    ///
    /// Product from the feedback
    ///
    public var product: ProductFeedback?
}

///
/// Product response from Feedback
///
public struct ProductFeedback: Codable {
    ///
    /// Public Initializer
    ///
    public init() {}
    
    ///
    /// Product ID
    ///
    public var id: String?
    
    ///
    /// Product title
    ///
    public var title: String?
}
