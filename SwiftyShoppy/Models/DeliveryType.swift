//
//  DeliveryType.swift
//  SwiftyShoppy
//
//  Created by Victor Lourme on 05/07/2020.
//

import Foundation

public enum DeliveryType: String, Codable {
    case service = "service"
    case account = "account"
    case file = "file"
    case dynamic = "dynamic"
}
