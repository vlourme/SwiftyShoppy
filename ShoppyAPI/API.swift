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
        case .showOrders:
            return "/v1/orders"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .showOrders:
            return .get
        }
    }
    
    var sampleData: Data {
        switch self {
        case .showOrders:
            guard let url = Bundle.main.url(forResource: "orders", withExtension: "json"),
                let data = try? Data(contentsOf: url) else {
                    return Data()
            }
            print(data)
            return data
        }
    }
    
    var task: Task {
        switch self {
        case .showOrders:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        return [
            "User-Agent": "SwiftyShoppy/1.0"
        ]
    }
}
