//
//  Tests.swift
//  Tests
//
//  Created by Victor Lourme on 28/06/2020.
//  Copyright © 2020 Victor Lourme. All rights reserved.
//

import XCTest
@testable import SwiftyShoppy

class Tests: XCTestCase {
    ///
    /// Get analytics
    ///
    func testGetAnalytics() throws {
        let exp = expectation(description: "Get analytics")
        
        NetworkManager
            .prepare(token: keys["token"] ?? "no token")
            .target(.getAnalytics)
            .asObject(Analytics.self,
                      success: { analytics in
                        debugPrint("Total orders: \(analytics.totalOrders ?? -1)")
                        
                        XCTAssert(true)
                        exp.fulfill()
            }, error: { error in
                XCTAssert(false)
                exp.fulfill()
            })
        
        wait(for: [exp], timeout: 10)
    }
    
    ///
    /// Get settings
    ///
    func testGetSettings() throws {
        let exp = expectation(description: "Get settings")
        
        NetworkManager
            .prepare(token: keys["token"] ?? "no token")
            .target(.getSettings)
            .asObject(Settings.self,
                      success: { settings in
                        debugPrint("User email: \(settings.user?.email ?? "-1")")
                        debugPrint("User avatar: \(settings.settings?.userAvatarURL ?? "-1")")
                        
                        XCTAssert(true)
                        exp.fulfill()
            }, error: { error in
                XCTAssert(false)
                exp.fulfill()
            })
        
        wait(for: [exp], timeout: 10)
    }
    
    ///
    /// Get a specific order
    ///
    func testGetOrder() throws {
        let exp = expectation(description: "Get order ID")
        
        NetworkManager
            .prepare(token: keys["token"] ?? "no token")
            .target(.getOrder(id: keys["order_id"] ?? "no order id"))
            .asObject(Order.self,
                      success: { order in
                        debugPrint("Order email: \(order.email ?? "-1")")
                        debugPrint("Order price: \(order.price ?? -1)")
                        debugPrint("Order quantity: \(order.quantity ?? -1)")
                        
                        XCTAssert(true)
                        exp.fulfill()
            }, error: { error in
                XCTAssert(false)
                exp.fulfill()
            })
        
        
        wait(for: [exp], timeout: 10)
    }
    
    ///
    /// Get list of orders
    ///
    func testGetOrders() throws {
        let exp = expectation(description: "Get order list")
        
        NetworkManager
            .prepare(token: keys["token"] ?? "no token")
            .target(.getOrders)
            .asArray(Order.self,
                     success: { orders in
                        debugPrint("Orders count: \(orders.count)")
                        
                        XCTAssert(true)
                        exp.fulfill()
            }, error: { error in
                XCTAssert(false)
                exp.fulfill()
            })
        
        wait(for: [exp], timeout: 10)
    }
    
    ///
    /// Get list of products
    ///
    func testGetProducts() throws {
        let exp = expectation(description: "Get product list")
        
        NetworkManager
            .prepare(token: keys["token"] ?? "no token")
            .target(.getProducts)
            .asArray(Product.self,
                     success: { products in
                        debugPrint("Products count: \(products.count)")
                        
                        XCTAssert(true)
                        exp.fulfill()
            }, error: { error in
                XCTAssert(false)
                exp.fulfill()
            })
        
        wait(for: [exp], timeout: 10)
    }
    
    ///
    /// Get a product
    ///
    func testGetProduct() throws {
        let exp = expectation(description: "Get a product")
        
        NetworkManager
            .prepare(token: keys["token"] ?? "no token")
            .target(.getProduct(id: keys["product_id"] ?? "no product"))
            .asObject(Product.self,
                      success: { product in
                        debugPrint("Product name: \(product.title ?? "-1")")
                        debugPrint(product)
                        
                        XCTAssert(true)
                        exp.fulfill()
            }, error: { error in
                XCTAssert(false)
                exp.fulfill()
            })
        
        wait(for: [exp], timeout: 10)
    }
    
    ///
    /// Create a product
    ///
    func testCreateProduct() throws {
        let exp = expectation(description: "Create a product")
        
        // Create product
        var product = Product()
        product.title = "Testing product"
        product.price = 15.51
        product.unlisted = true
        product.gateways = [
            .bitcoin,
            .ethereum
        ]
        product.type = .service
        
        NetworkManager
            .prepare(token: keys["token"] ?? "no token")
            .target(.createProduct(product))
            .asObject(UpdatedProduct.self,
                      success: { update in
                        print("Status: \(update.message ?? "-1")")
                        print("Product ID: \(update.resource?.id ?? "-1")")
                        
                        XCTAssert(true)
                        exp.fulfill()
            }, error: { error in
                XCTAssert(false)
                exp.fulfill()
            })
        
        wait(for: [exp], timeout: 10)
    }
    
    ///
    /// Update a product
    ///
    func testUpdateProduct() throws {
        let exp = expectation(description: "Update a product")
        
        // Get product
        NetworkManager
            .prepare(token: keys["token"] ?? "no token")
            .target(.getProduct(id: "Product title"))
            .asObject(Product.self,
                      success: { product in
                        // Edit product
                        var prod = product
                        prod.title = "New title!"
                        
                        // Update product
                        NetworkManager
                            .prepare(token: keys["token"] ?? "no token")
                            .target(.updateProduct(prod))
                            .asObject(UpdatedProduct.self,
                                      success: { update in
                                        // Update product
                                        print("Status: \(update.message ?? "-1")")
                                        print("Product ID: \(update.resource?.id ?? "-1")")
                                        print("Product title: \(update.resource?.title ?? "-1")")
                                        
                                        XCTAssert(true)
                                        exp.fulfill()
                            }, error: { error in
                                XCTAssert(false)
                                exp.fulfill()
                            })
            }, error: { error in
                XCTAssert(false)
                exp.fulfill()
            })
        
        wait(for: [exp], timeout: 10)
    }
    
    ///
    /// Delete a product
    ///
    func testDeleteProduct() throws {
        let exp = expectation(description: "Delete a product")
        
        NetworkManager
            .prepare(token: keys["token"] ?? "no token")
            .target(.deleteProduct(id: "ProductID"))
            .asObject(UpdatedProduct.self,
                      success: { update in
                        debugPrint("Message: \(update.message ?? "-1")")
                        debugPrint("Product deleted: \(update.resource?.title ?? "-1")")
                        
                        XCTAssert(true)
                        exp.fulfill()
            }, error: { error in
                XCTAssert(false)
                exp.fulfill()
            })
        
        wait(for: [exp], timeout: 10)
    }
    
    ///
    /// Delete product image
    ///
    func testDeleteProductImage() throws {
        let exp = expectation(description: "Delete product image")
        
        NetworkManager
            .prepare(token: keys["token"] ?? "no token")
            .target(.deleteProductImage(id: "To2qHRv"))
            .asObject(UpdatedProduct.self,
                      success: { update in
                        debugPrint("Message: \(update.message ?? "-1")")
                        // No resource is returned on deleteProductImage endpoint
                        
                        XCTAssert(true)
                        exp.fulfill()
            }, error: { error in
                XCTAssert(false)
                exp.fulfill()
            })
        
        wait(for: [exp], timeout: 10)
    }
}
