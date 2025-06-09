//
//  HomeViewModel.swift
//  eCommerceSwift
//
//  Created by Bonmyeong Koo - Vendor on 6/8/25.
//

import Foundation

@MainActor
class HomeViewModel: ObservableObject {
    @Published var products: [Product] = []
    private let productService: ProductServiceProtocol

    init(productService: ProductServiceProtocol = ProductService()) {
        self.productService = productService
    }

    func loadProducts() async {
        do {
            products = try await productService.fetchProducts()
        } catch {
            print("Error fetching products: \(error)")
        }
    }
}
