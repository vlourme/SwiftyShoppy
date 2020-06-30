//
//  NetworkManager.swift
//  SwiftyShoppy
//
//  Created by Victor Lourme on 29/06/2020.
//  Copyright © 2020 Victor Lourme. All rights reserved.
//

import Foundation
import Moya

public struct NetworkManager: Networkable {
    ///
    /// Constructor
    ///
    init(token: String) {
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
    
    ///
    /// Get analytics
    /// - returns: Analytic object or Error
    ///
    func getAnalytics(completion: @escaping (Analytics?, Error?) -> ()) {
        provider.request(.getAnalytics) { response in
            switch response {
            case .failure(let error):
                print("ERROR!")
                completion(nil, error)
            case .success(let value):
                do {
                    let response = try value.filterSuccessfulStatusCodes()
                    let analytics = try response.map(Analytics.self, using: self.decoder, failsOnEmptyData: false)
                    completion(analytics, nil)
                } catch let error {
                    completion(nil, error)
                }
            }
            
        }
    }
    
    ///
    /// Get an specific order
    /// - returns: Order object or Error
    ///
    func getOrder(id: String, completion: @escaping (Order?, Error?) -> ()) {
        provider.request(.getOrder(id: id)) { response in
            switch response {
            case .failure(let error):
                print("ERROR!")
                completion(nil, error)
            case .success(let value):
                do {
                    let response = try value.filterSuccessfulStatusCodes()
                    let order = try response.map(Order.self, using: self.decoder, failsOnEmptyData: false)
                    completion(order, nil)
                } catch let error {
                    completion(nil, error)
                }
            }
            
        }
    }
    
    ///
    /// Get orders
    /// - returns: Order array or Error
    ///
    func getOrders(completion: @escaping ([Order]?, Error?) -> ()) {
        provider.request(.showOrders) { response in
            switch response {
            case .failure(let error):
                print("ERROR!")
                completion(nil, error)
            case .success(let value):
                do {
                    let response = try value.filterSuccessfulStatusCodes()
                    let orders = try response.map([Order].self, using: self.decoder, failsOnEmptyData: false)
                    completion(orders, nil)
                } catch let error {
                    completion(nil, error)
                }
            }
            
        }
    }
}
