//
//  Profile.swift
//  SwiftyShoppy
//
//  Created by Victor Lourme on 30/07/2020.
//

import Foundation
import BetterCodable

///
/// Profile response (use this with .getProfile)
///
public struct ProfileResponse: Codable {
    ///
    /// Status of the request
    ///
    public var status: Bool?
    
    ///
    /// Status message
    ///
    public var message: String?
    
    ///
    /// User
    ///
    public var user: Profile?
}

///
/// Public profile structure
///
public struct Profile: Codable {
    ///
    /// Username
    ///
    public var username: String?
    
    ///
    /// Avatar URL
    ///
    public var avatar: String?
    
    ///
    /// User reputation (feedbacks)
    ///
    public var rep: Reputation?
    
    ///
    /// Products
    ///
    public var products: [Product?]?
    
    ///
    /// Feedbacks
    ///
    public var feedbacks: [Feedback?]?
    
    ///
    /// Online status
    ///
    public var online: UserStatus?
    
    ///
    /// Is admin/moderator
    ///
    public var staff: Bool?
}

///
/// Reputation structure
///
public struct Reputation: Codable {
    ///
    /// Positive feedbacks
    ///
    public var positive: Int?
    
    ///
    /// Neutral feedbacks
    ///
    public var neutral: Int?
    
    ///
    /// Negative feedbacks
    ///
    public var negative: Int?
}

public struct UserStatus: Codable {
    ///
    /// Logged
    ///
    public var state: Bool?
    
    ///
    /// Logged since *time*
    ///
    @LosslessValue public var ago: String
}
