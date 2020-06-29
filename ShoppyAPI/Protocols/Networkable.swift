//
//  Networkable.swift
//  SwiftyShoppy
//
//  Created by Victor Lourme on 29/06/2020.
//  Copyright © 2020 Victor Lourme. All rights reserved.
//

import Foundation
import Moya

///
/// Networkable Protocol
///
protocol Networkable {
    ///
    /// Init method for authentication
    ///
    init(token: String)
    
    ///
    /// Provider
    ///
    var provider: MoyaProvider<Shoppy> { get }
    
    ///
    /// Decoder
    ///
    var decoder: JSONDecoder { get }
    
    ///
    /// Endpoints Handler
    ///
    func getOrders(completion: @escaping ([Order]?, Error?) -> ())
}
