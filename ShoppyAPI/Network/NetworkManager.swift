//
//  NetworkManager.swift
//  SwiftyShoppy
//
//  Created by Victor Lourme on 29/06/2020.
//  Copyright © 2020 Victor Lourme. All rights reserved.
//

import Foundation
import Moya

struct NetworkManager: Networkable {
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
        decoder.dateDecodingStrategy = .secondsSince1970
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
    /// Get orders
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
