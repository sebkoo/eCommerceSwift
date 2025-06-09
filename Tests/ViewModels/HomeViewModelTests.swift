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

    func fetchProducts() async throws -> [Product] {
        switch fetchProductsResult {
        case .success(let products): return products
        case .failure(let error): throw error
        }
    }
}
