//
//  Tests.swift
//  Tests
//
//  Created by Victor Lourme on 28/06/2020.
//  Copyright © 2020 Victor Lourme. All rights reserved.
//

import XCTest
@testable import SwiftyShoppy

enum TestError: Error {
    case PlistNotFound
    case FileError
}

class Tests: XCTestCase {
    ///
    /// Environment
    ///
    var keys: [String: String]?
    
    ///
    /// NetworkManager
    ///
    var manager: NetworkManager? = nil
    
    ///
    /// Setup NetworkManager
    ///
    override func setUpWithError() throws {
        // Load file
        guard let url = Bundle(for: Tests.self).url(forResource: "Keys", withExtension: "plist") else {
            throw TestError.PlistNotFound
        }
        
        // Load keys
        guard let fileContent = NSDictionary(contentsOf: url) as? [String: String] else {
            throw TestError.FileError
        }
        
        // Save keys
        keys = fileContent
        
        // Instance NetworkManager
        manager = NetworkManager(token: keys?["token"] ?? "")
    }
    
    ///
    /// Get list of orders
    ///
    func testGetOrders() throws {
        let exp = expectation(description: "Get order list")
        
        manager?.getOrders() { (result, error) in
            debugPrint("RESULT: \(result)")
            
            XCTAssertNil(error)
            exp.fulfill()
        }
        
        wait(for: [exp], timeout: 10)
    }
}
