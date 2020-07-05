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
    /// Get settings
    /// - returns: Settings object or Error
    ///
    public func getSettings(completion: @escaping (Settings?, Error?) -> ()) {
        provider.request(.getSettings) { response in
            switch response {
            case .failure(let error):
                completion(nil, error)
            case .success(let value):
                do {
                    let response = try value.filterSuccessfulStatusCodes()
                    let orders = try response.map(Settings.self, using: self.decoder, failsOnEmptyData: false)
                    completion(orders, nil)
                } catch let error {
                    completion(nil, error)
                }
            }
        }
    }
}
