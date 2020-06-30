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
    /// Analytics
    ///
    case getAnalytics
    
    ///
    /// Orders
    ///
    case getOrder(id: String)
    case showOrders
}