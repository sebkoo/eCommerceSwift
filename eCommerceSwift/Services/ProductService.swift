//
//  ProductService.swift
//  eCommerceSwift
//
//  Created by Bonmyeong Koo - Vendor on 6/8/25.
//

import Foundation

protocol ProductServiceProtocol {
    func fetchProducts() async throws -> [Product]
}

class ProductService: ProductServiceProtocol {
    private let baseURL = "https://fakestoreapi.com"

    func fetchProducts() async throws -> [Product] {
        let url = URL(string: "\(baseURL)/products")!
        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode([Product].self, from: data)
    }
}
