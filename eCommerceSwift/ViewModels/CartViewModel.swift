//
//  CartViewModel.swift
//  eCommerceSwift
//
//  Created by Bonmyeong Koo - Vendor on 6/8/25.
//

import Foundation

@MainActor
class CartViewModel: ObservableObject {
    @Published var currentCart: Cart?
    @Published var products: [Int: Product] = [:]
    private let productService: ProductServiceProtocol
    private let userId: Int = 1// For demo; in reality, get from AuthService

    init(productService: ProductServiceProtocol = ProductService()) {
        self.productService = productService
    }

    func loadCart() async {
        do {
            let carts = try await productService.fetchCarts(for: userId)
            currentCart = carts.first
            if let cart = currentCart {
                for product in cart.products {
                    if products[product.productId] == nil {
                        // Assume fetchProduct exists; add if needed
                        products[product.productId] = Product(
                            id: product.productId,
                            title: "Placeholder",
                            price: 0,
                            description: "",
                            category: "",
                            image: ""
                        )
                    }
                }
            }
        } catch {
            print("Error loading cart: \(error)")
        }
    }

    func addToCart(productId: Int, quantity: Int) async {
        if var cart = currentCart {
            if let index = cart.products.firstIndex(where: { $0.productId == productId }) {
                cart.products[index].quantity += quantity
            } else {
                cart.products.append(CartProduct(productId: productId, quantity: quantity))
            }
            do {
                currentCart = try await productService.updateCart(cart: cart)
            } catch {
                print("Error updating cart: \(error)")
            }
        } else {
            let newCart = Cart(id: nil, userId: userId, date: Date().ISO8601Format(), products: [CartProduct(productId: productId, quantity: quantity)])
            do {
                currentCart = try await productService.createCart(cart: newCart)
            } catch {
                print("Error creating cart: \(error)")
            }
        }
    }
}
