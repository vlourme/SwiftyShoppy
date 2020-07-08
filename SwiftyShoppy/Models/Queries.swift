//
//  Queries.swift
//  SwiftyShoppy
//
//  Created by Victor Lourme on 08/07/2020.
//

import Foundation

///
/// Query structure
///
public struct Query: Codable {
    ///
    /// Public Initializer
    ///
    public init() {}
    
    ///
    /// Query identifier
    ///
    public var id: String?
    
    ///
    /// Query status
    ///
    public var status: QueryStatus.RawValue?
    
    ///
    /// Subject
    ///
    public var subject: String?
    
    ///
    /// Sender email
    ///
    public var email: String?
    
    ///
    /// First message of the query
    ///
    public var message: String?
    
    ///
    /// Creation date
    ///
    public var created_at: Date?
    
    ///
    /// Last update (last message or action like closing, re-opening)
    ///
    public var updated_at: Date?
    
    ///
    /// Replies
    ///
    public var replies: [QueryReply]?
    
    ///
    /// Sender agent
    ///
    public var agent: Agent?
}

///
/// Query reply
///
public struct QueryReply: Codable {
    ///
    /// Public Initializer
    ///
    public init() {}
    
    ///
    /// Message identifier
    ///
    public var id: String?
    
    ///
    /// Query identifier
    ///
    public var query: String?
    
    ///
    /// Seller ID of the user (null if the user does not have account)
    ///
    public var seller_id: Int?
    
    ///
    /// Message
    ///
    public var message: String?
    
    ///
    /// Sent date of the message
    ///
    public var created_at: Date?
    
    ///
    /// Last update of the message (equal as created_at by default)
    ///
    public var last_update: Date?
    
    ///
    /// Deletion date of the message (null if not deleted)
    ///
    public var deleted_at: Date?
    
    ///
    /// Supporter (true means you're the sender)
    ///
    public var is_supporter: Bool?
}

///
/// Query response on .updateQuery (parse it using generics: ResourceUpdate<QueryActionResponse>)
///
public struct QueryActionResponse: Codable {
    ///
    /// Public Initializer
    ///
    public init() {}
    
    ///
    /// Processing message
    ///
    public var message: String?
    
    ///
    /// Query new status
    ///
    public var query_status: QueryStatus.RawValue?
}

///
/// Query status
///
public enum QueryStatus: Int {
    case Open = 0
    case UserReply = 1
    case Replied = 2
    case Closed = 3
}

///
/// Query actions
///
public enum QueryAction: String {
    case ReOpen = "reopen"
    case Close = "close"
}
