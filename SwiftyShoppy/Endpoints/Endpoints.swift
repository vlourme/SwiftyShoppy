//
//  Endpoints.swift
//  SwiftyShoppy
//
//  Created by Victor Lourme on 29/06/2020.
//  Copyright © 2020 Victor Lourme. All rights reserved.
//

import Foundation

enum Shoppy {
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
    case getOrder(id: String)
    
    ///
    /// Products
    ///
    case getProducts
    case getProduct(id: String)
    case createProduct(_ product: Product)
    case updateProduct(_ product: Product)
    case deleteProduct(id: String)
    case deleteProductImage(id: String)
}
