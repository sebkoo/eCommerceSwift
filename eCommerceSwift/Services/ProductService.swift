//
//  ProductService.swift
//  eCommerceSwift
//
//  Created by Bonmyeong Koo - Vendor on 6/8/25.
//

import Foundation

protocol ProductServiceProtocol {
    func fetchProducts() async throws -> [Product]
    func login(username: String, password: String) async throws -> String
    func fetchCarts(for userId: Int) async throws -> [Cart]
    func createCart(cart: Cart) async throws -> Cart
    func updateCart(cart: Cart) async throws -> Cart
}

class ProductService: ProductServiceProtocol {
    private let baseURL = "https://fakestoreapi.com"

    func fetchProducts() async throws -> [Product] {
        let url = URL(string: "\(baseURL)/products")!
        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode([Product].self, from: data)
    }

    func login(username: String, password: String) async throws -> String {
        let url = URL(string: "\(baseURL)/auth/login")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let loginRequest = LoginRequest(username: username, password: password)
        request.httpBody = try JSONEncoder().encode(loginRequest)

        let (data, _) = try await URLSession.shared.data(for: request)
        let response = try JSONDecoder().decode(LoginResponse.self, from: data)
        return response.token
    }

    func fetchCarts(for userId: Int) async throws -> [Cart] {
        let url = URL(string: "\(baseURL)/carts/user/\(userId)")!
        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode([Cart].self, from: data)
    }

    func createCart(cart: Cart) async throws -> Cart {
        let url = URL(string: "\(baseURL)/carts")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try JSONEncoder().encode(cart)
        let (data, _) = try await URLSession.shared.data(for: request)
        return try JSONDecoder().decode(Cart.self, from: data)
    }

    func updateCart(cart: Cart) async throws -> Cart {
        guard let id = cart.id else { throw URLError(.badURL) }
        let url = URL(string: "\(baseURL)/carts/\(id)")!
        var request = URLRequest(url: url)
        request.httpMethod = "PUT"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try JSONEncoder().encode(cart)
        let (data, _) = try await URLSession.shared.data(for: request)
        return try JSONDecoder().decode(Cart.self, from: data)
    }
}
