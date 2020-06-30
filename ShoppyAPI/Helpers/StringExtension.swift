//
//  StringExtension.swift
//  SwiftyShoppy
//
//  Created by Victor Lourme on 30/06/2020.
//  Copyright © 2020 Victor Lourme. All rights reserved.
//

import Foundation

extension String {
    ///
    /// Get Data for a JSON path
    /// - returns: Data()
    ///
    func getDataForJSON() -> Data {
        guard let url = Bundle.main.url(forResource: self, withExtension: "json"),
            let data = try? Data(contentsOf: url) else {
                return Data()
        }
        return data
    }
}
