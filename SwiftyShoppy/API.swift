//
//  API.swift
//  SwiftyShoppy
//
//  Created by Victor Lourme on 28/06/2020.
//  Copyright © 2020 Victor Lourme. All rights reserved.
//

import Moya
import Foundation

///
/// Shoppy Structure
///
extension Shoppy : TargetType, AccessTokenAuthorizable {
    var baseURL: URL {
        return URL(string: "https://shoppy.gg/api")!
    }
    
    var authorizationType: AuthorizationType? {
        return .custom("")
    }
    
    var path: String {
        switch self {
        case .getSettings:
            return "/v1/settings"
        case .getAnalytics:
            return "/v1/analytics"
        case .getOrder(let id):
            return "/v1/orders/\(id)"
        case .getOrders:
            return "/v1/orders"
        case .getProducts:
            return "/v1/products"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getOrders,
             .getOrder,
             .getAnalytics,
             .getSettings,
             .getProducts:
            return .get
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        return .requestPlain
    }
    
    var headers: [String : String]? {
        return [
            "User-Agent": "SwiftyShoppy/1.0"
        ]
    }
}
