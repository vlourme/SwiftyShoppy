//
//  Products.swift
//  SwiftyShoppy
//
//  Created by Victor Lourme on 05/07/2020.
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
    public func getProducts(completion: @escaping ([Product]?, Error?) -> ()) {
        provider.request(.getProducts) { response in
            switch response {
            case .failure(let error):
                completion(nil, error)
            case .success(let value):
                do {
                    let response = try value.filterSuccessfulStatusCodes()
                    let products = try response.map([Product].self, using: self.decoder, failsOnEmptyData: false)
                    completion(products, nil)
                } catch let error {
                    completion(nil, error)
                }
            }
        }
    }
}
