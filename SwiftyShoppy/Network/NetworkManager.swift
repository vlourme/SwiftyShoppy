//
//  NetworkManager.swift
//  SwiftyShoppy
//
//  Created by Victor Lourme on 29/06/2020.
//  Copyright © 2020 Victor Lourme. All rights reserved.
//

import Foundation
import Moya

public struct NetworkManager {
    ///
    /// Constructor
    ///
    public init(token: String) {
        // Generate provider with token
        provider = MoyaProvider<Shoppy>(plugins: [
            NetworkLoggerPlugin(),
            AccessTokenPlugin { _ in token }
        ])
        
        // Instance JSONDecoder
        decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(DateFormatter.iso8601Full)
    }
    
    ///
    /// Provider
    ///
    var provider: MoyaProvider<Shoppy>
    
    ///
    /// Decoder
    ///
    var decoder: JSONDecoder
}
