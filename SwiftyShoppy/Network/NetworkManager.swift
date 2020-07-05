//
//  NetworkManager.swift
//  SwiftyShoppy
//
//  Created by Victor Lourme on 29/06/2020.
//  Copyright © 2020 Victor Lourme. All rights reserved.
//

import Foundation
import Moya

public class NetworkManager {
    ///
    /// Provider
    ///
    public static var provider: MoyaProvider<Shoppy> = .init()
    
    ///
    /// Decoder
    ///
    public static var decoder: JSONDecoder = JSONDecoder()
    
    ///
    /// Request target
    ///
    public static var target: Shoppy = .getAnalytics
    
    ///
    /// Prepare request
    ///
    public static func prepare(token: String) -> NetworkManager.Type {
        // Generate provider with token
        provider = MoyaProvider<Shoppy>(plugins: [
            NetworkLoggerPlugin(),
            AccessTokenPlugin { _ in token }
        ])
        
        // Set date decoding strategy
        decoder.dateDecodingStrategy = .formatted(DateFormatter.iso8601Full)
        
        // Return chaining
        return NetworkManager.self
    }
    
    ///
    /// Set target
    ///
    public static func target(_ target: Shoppy) -> NetworkManager.Type {
        // Set target
        self.target = target
        
        // Return chaining
        return NetworkManager.self
    }
    
    ///
    /// Get response as array of object
    /// - returns: Array of object [T]
    ///
    public static func asArray<T: Decodable>(_ type: T.Type,
                                      success successCallback: @escaping ([T]) -> Void,
                                      error errorCallback: @escaping (Error) -> Void) {
        // Make request
        provider.request(target) { response in
            // Parse response
            switch response {
            case .success(let response):
                do {
                    // Get successful responses
                    let resp = try response.filterSuccessfulStatusCodes()
                    
                    // Parse codable
                    let json = try resp.map([T].self, using: self.decoder, failsOnEmptyData: false)
                    
                    // Success
                    successCallback(json)
                } catch let error {
                    errorCallback(error)
                }
            case .failure(let error):
                errorCallback(error)
            }
        }
    }
    
    ///
    /// Get response as single object
    /// - returns: Single object [T]
    ///
    public static func asObject<T: Decodable>(_ type: T.Type,
                                success successCallback: @escaping (T) -> Void,
                                error errorCallback: @escaping (Error) -> Void) {
        // Make request
        provider.request(target) { response in
            // Parse response
            switch response {
            case .success(let response):
                do {
                    // Get successful responses
                    let resp = try response.filterSuccessfulStatusCodes()
                    
                    // Parse codable
                    let json = try resp.map(T.self, using: self.decoder, failsOnEmptyData: false)
                    
                    // Success
                    successCallback(json)
                } catch let error {
                    errorCallback(error)
                }
            case .failure(let error):
                errorCallback(error)
            }
        }
    }
}
