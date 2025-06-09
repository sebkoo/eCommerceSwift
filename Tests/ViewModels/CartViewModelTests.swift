//
//  CartViewModelTests.swift
//  Tests
//
//  Created by Bonmyeong Koo - Vendor on 6/8/25.
//

import Testing
@testable import eCommerceSwift

struct CartViewModelTests {

    @Test func test_addToCart_createNew() async throws {
        let mockService = MockProductService()
        let cart = Cart(id: 1, userId: 1, date: "2023-01-01", products: [CartProduct(productId: 1, quantity: 1)])
//        mockService.createC
    }

}

extension MockProductService {
    func fetchCarts(for userId: Int) async throws -> [Cart] { [] }
    func updateCart(cart: Cart) async throws -> Cart { cart }

    func createCart(cart: Cart) async throws -> Cart {
        switch createCartResult {
        case .success(let cart): return cart
        case .failure(let error): throw error
        }
    }
}
