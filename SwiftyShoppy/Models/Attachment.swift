//
//  Attachment.swift
//  SwiftyShoppy
//
//  Created by Victor Lourme on 09/07/2020.
//

import Foundation

///
/// Attachment structure
///
public struct Attachment: Codable {
    ///
    /// Public Initializer
    ///
    public init() {}
    
    ///
    /// Attachment identifier
    ///
    public var id: String?
    
    ///
    /// Seller identifier
    ///
    public var seller_id: Int?
    
    ///
    /// File size in byte
    ///
    public var file_size: Int?
    
    ///
    /// File MIME
    ///
    public var file_mime_type: String?
    
    ///
    /// File name
    ///
    public var file_name: String?
    
    ///
    /// Path to the attachment
    ///
    public var path: String?
    
    ///
    /// Deletion date (most likely nil)
    ///
    public var deleted_at: Date?
    
    ///
    /// Date of file upload
    ///
    public var created_at: Date?
    
    ///
    /// File last edit
    ///
    public var updated_at: Date?
}
