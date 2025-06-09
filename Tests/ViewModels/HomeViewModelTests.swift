//
//  HomeViewModelTests.swift
//  Tests
//
//  Created by Bonmyeong Koo - Vendor on 6/8/25.
//

import Testing
@testable import eCommerceSwift

struct HomeViewModelTests {

    @Test func test_loadProducts_success() async throws {
        let mockService = MockProductService()
        let expectedProducts = [Product(
            id: 1,
            title: "Test",
            price: 10.0,
            description: "Test",
            category: "Test",
            image: "https://example.com")
        ]
        mockService.fetchProductsResult = .success(expectedProducts)

        let viewModel = await HomeViewModel(productService: mockService)
        await viewModel.loadProducts()

        await #expect(viewModel.products == expectedProducts)
    }

}

class MockProductService: ProductServiceProtocol {    
    var fetchProductsResult: Result<[Product], Error> = .success([])
    var loginResult: Result<String, Error> = .success("")
    var createCartResult: Result<Cart, Error> = .success(Cart(id: nil, userId: 0, date: "", products: []))

    func fetchProducts() async throws -> [Product] {
        switch fetchProductsResult {
        case .success(let products): return products
        case .failure(let error):     throw error
        }
    }

    func login(username: String, password: String) async throws -> String {
        switch loginResult {
        case .success(let token): return token
        case .failure(let error):  throw error
        }
    }
}
