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
    /// NetworkManager
    ///
    var manager: NetworkManager?
    
    ///
    /// Setup NetworkManager
    ///
    override func setUpWithError() throws {
        // Instance NetworkManager
        manager = NetworkManager(token: keys["token"] ?? "")
    }
    
    ///
    /// Get a specific order
    ///
    func testGetOrder() throws {
        let exp = expectation(description: "Get order ID")
        
        manager?.getOrder(id: keys["order_id"] ?? "") { order, error in
            // Debug
            debugPrint("Price: \(order?.price ?? 0)")
            debugPrint("Quantity: \(order?.quantity ?? 0)")
            debugPrint("Accounts delivered: \(order?.accounts?.count ?? 0)")
            debugPrint("Product name: \(order?.product?.title ?? "Unknown")")
            debugPrint("Date: \(String(describing: order?.paid_at))")
            
            // Assert
            XCTAssertNil(error)
            exp.fulfill()
        }
        
        
        wait(for: [exp], timeout: 10)
    }
    
    ///
    /// Get list of orders
    ///
    func testGetOrders() throws {
        let exp = expectation(description: "Get order list")
        
        manager?.getOrders() { (result, error) in
            debugPrint("Quantity of orders: \(result?.count ?? 0)")
            
            XCTAssertNil(error)
            exp.fulfill()
        }
        
        wait(for: [exp], timeout: 10)
    }
}
