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
    }
    
    ///
    /// Provider
    ///
    var provider: MoyaProvider<Shoppy>
    
    ///
    /// Decoder
    ///
    var decoder = JSONDecoder()
    
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
                    // Check for error
                    if 200 ... 299 ~= value.statusCode {
                        // Return array
                        let orders = try self.decoder.decode([Order].self, from: value.data)
                        completion(orders, nil)
                    } else {
                        completion(nil, ShoppyError(code: value.statusCode))
                    }
                } catch let error {
                    completion(nil, error)
                }
            }
            
        }
    }
}
