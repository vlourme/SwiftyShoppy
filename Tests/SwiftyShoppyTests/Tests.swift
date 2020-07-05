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
    /// Get analytics
    ///
    func testGetAnalytics() throws {
        let exp = expectation(description: "Get analytics")
        
        manager?.getAnalytics() { analytics, error in
            // Debug
            debugPrint("Total orders: \(analytics?.totalOrders ?? -1)")
            debugPrint("Total revenue: \(analytics?.totalRevenue ?? -1)")
            
            XCTAssertNil(error)
            exp.fulfill()
        }
        
        wait(for: [exp], timeout: 10)
    }
    
    ///
    /// Get settings
    ///
    func testGetSettings() throws {
        let exp = expectation(description: "Get settings")
        
        manager?.getSettings() { settings, error in
            // Debug
            debugPrint("Username: \(settings?.user?.username ?? "Unknown")")
            debugPrint("Email: \(settings?.user?.email ?? "Unknown")")
            debugPrint("Bitcoin: \(settings?.settings?.bitcoinAddress ?? "Unknown")")
            
            XCTAssertNil(error)
            exp.fulfill()
        }
        
        wait(for: [exp], timeout: 10)
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
            debugPrint("Agent: \(String(describing: order?.agent))")
            
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
    
    ///
    /// Get list of products
    ///
    func testGetProducts() throws {
        let exp = expectation(description: "Get product list")
        
        manager?.getProducts() { (result, error) in
            debugPrint("Quantity of products: \(result?.count ?? 0)")
            
            XCTAssertNil(error)
            exp.fulfill()
        }
        
        wait(for: [exp], timeout: 10)
    }
}
