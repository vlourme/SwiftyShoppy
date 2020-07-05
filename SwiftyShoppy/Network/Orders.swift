//
//  Orders.swift
//  SwiftyShoppy
//
//  Created by Victor Lourme on 04/07/2020.
//

import Foundation

///
/// NetworkManager -> Order API Extension
///
extension NetworkManager {
    ///
    /// Get an specific order
    /// - returns: Order object or Error
    ///
    public func getOrder(id: String, completion: @escaping (Order?, Error?) -> ()) {
        provider.request(.getOrder(id: id)) { response in
            switch response {
            case .failure(let error):
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
    public func getOrders(completion: @escaping ([Order]?, Error?) -> ()) {
        provider.request(.showOrders) { response in
            switch response {
            case .failure(let error):
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
