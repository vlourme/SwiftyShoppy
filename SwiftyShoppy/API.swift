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
        }
    }
    
    public var method: Moya.Method {
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
        case .updateProduct,
             .deleteProductImage,
             .uploadProductImage:
            return .post
        case .deleteProduct:
            return .delete
        }
    }
    
    public var sampleData: Data {
        return Data()
    }
    
    public var task: Task {
        switch self {
        case let .createProduct(product),
             let .updateProduct(product):
            return .requestJSONEncodable(product)
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
