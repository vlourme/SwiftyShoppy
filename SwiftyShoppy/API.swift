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
        case .getOrders:
            return "/v1/orders"
        case .getOrder(let id):
            return "/v1/orders/\(id)"
        case .getProducts:
            return "/v1/products"
        case .getProduct(let id):
            return "/v1/products/\(id)"
        case .createProduct:
            return "/v1/products"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getOrders,
             .getOrder,
             .getAnalytics,
             .getSettings,
             .getProducts,
             .getProduct:
            return .get
        case .createProduct:
            return .put
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case let .createProduct(product):
            return .requestJSONEncodable(product)
        default:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        return [
            "User-Agent": "SwiftyShoppy/1.0"
        ]
    }
}
