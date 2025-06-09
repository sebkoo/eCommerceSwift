//
//  ProductTests.swift
//  Tests
//
//  Created by Bonmyeong Koo - Vendor on 6/8/25.
//

import Testing
import Foundation
@testable import eCommerceSwift

struct ProductTests {

    @Test func test_decodeProduct() throws {
        let json = """
            {
                "id": 1,
                "title": "Test Product",
                "price": 10.0,
                "description": "Test",
                "category": "Test",
                "image": "https://example.com/image.jpg"
            }
            """.data(using: .utf8)!

        let product = try JSONDecoder().decode(Product.self, from: json)
        #expect(product.id == 1)
        #expect(product.title == "Test Product")
    }

}
