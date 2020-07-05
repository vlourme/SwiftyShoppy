//
//  Gateways.swift
//  SwiftyShoppy
//
//  Created by Victor Lourme on 05/07/2020.
//

import Foundation

///
/// Gateways
///
public enum Gateways: String, Codable {
    case bitcoin = "Bitcoin"
    case ethereum = "Ethereum"
    case litecoin = "Litecoin"
    case paypal = "PayPal"
    case stripe = "Stripe"
}
