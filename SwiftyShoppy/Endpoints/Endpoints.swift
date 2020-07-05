//
//  Endpoints.swift
//  SwiftyShoppy
//
//  Created by Victor Lourme on 29/06/2020.
//  Copyright © 2020 Victor Lourme. All rights reserved.
//

import Foundation

public enum Shoppy {
    ///
    /// Settings
    ///
    case getSettings
    
    ///
    /// Analytics
    ///
    case getAnalytics
    
    ///
    /// Orders
    ///
    case getOrders
    case getOrder(_ id: String)
    
    ///
    /// Products
    ///
    case getProducts
    case getProduct(_ id: String)
    case createProduct(_ product: Product)
    case updateProduct(_ product: Product)
    case deleteProduct(_ id: String)
    case uploadProductImage(_ id: String, image: Data)
    case deleteProductImage(_ id: String)
}
