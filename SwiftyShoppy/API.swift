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
    public var baseURL: URL {
        return URL(string: "https://shoppy.gg/api")!
    }
    
    public var authorizationType: AuthorizationType? {
        return .custom("")
    }
    
    public var path: String {
        switch self {
        case .getSettings:
            return "/v1/settings"
        case .getAnalytics:
            return "/v1/analytics"
        case .getMetrics:
            return "/v1/home/metrics"
        case .getOrders:
            return "/v1/orders"
        case let .getOrder(id):
            return "/v1/orders/\(id)"
        case .getProducts:
            return "/v1/products"
        case let .getProduct(id),
             let .deleteProduct(id):
            return "/v1/products/\(id)"
        case .createProduct:
            return "/v1/products"
        case let .updateProduct(product):
            return "/v1/products/\(product.id ?? "-1")"
        case let .uploadProductImage(id, _):
            return "/v1/products/\(id)/image"
        case let .deleteProductImage(id):
            return "/v1/products/\(id)/deleteImage"
        case .getQueries:
            return "/v1/queries"
        case let .getQuery(id):
            return "/v1/queries/\(id)"
        case let .replyToQuery(id, _):
            return "/v1/query/\(id)/reply"
        case let .updateQuery(id, action):
            return "/v1/query/\(id)/\(action.rawValue)"
        case .getAttachments:
            return "/v1/attachments"
        }
    }
    
    public var method: Moya.Method {
        switch self {
        case .createProduct,
             .replyToQuery:
            return .put
            
        case .updateProduct,
             .deleteProductImage,
             .uploadProductImage,
             .updateQuery:
            return .post
            
        case .deleteProduct:
            return .delete
            
        default:
            return .get
        }
    }
    
    public var sampleData: Data {
        return Data()
    }
    
    public var task: Task {
        switch self {
        case let .getMetrics(type, range):
            return .requestParameters(parameters: [
                "card": type.rawValue,
                "range": range,
            ], encoding: URLEncoding.queryString)
            
        case let .getOrders(page),
             let .getProducts(page),
             let .getQueries(page):
            return .requestParameters(parameters: [
                "page": page
            ], encoding: URLEncoding.queryString)
            
        case let .createProduct(product),
             let .updateProduct(product):
            return .requestJSONEncodable(product)
            
        case let .replyToQuery(_, message):
            return .requestParameters(parameters: [
                "message": message
            ], encoding: JSONEncoding.default)
            
        case let .uploadProductImage(_, image):
            return .uploadMultipart([
                MultipartFormData(provider: .data(image), name: "file", fileName: "image.png", mimeType: "image/png")
            ])
            
        default:
            return .requestPlain
        }
    }
    
    public var headers: [String : String]? {
        return [
            "User-Agent": "SwiftyShoppy/1.0"
        ]
    }
}
