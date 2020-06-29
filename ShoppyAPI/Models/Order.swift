//
//  Order.swift
//  SwiftyShoppy
//
//  Created by Victor Lourme on 29/06/2020.
//  Copyright © 2020 Victor Lourme. All rights reserved.
//

import Foundation

struct Order: Codable {
    var id: String
    var email: String
    var price: Double
}
