//
//  PrivateAPI.swift
//  SwiftyShoppy
//
//  Created by Victor Lourme on 04/07/2020.
//

import Foundation

///
/// NetworkManager -> Private API Extension
///
extension NetworkManager {
    ///
    /// Get analytics
    /// - returns: Analytic object or Error
    ///
    public func getAnalytics(completion: @escaping (Analytics?, Error?) -> ()) {
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
}
