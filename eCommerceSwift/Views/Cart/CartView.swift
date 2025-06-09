//
//  CartView.swift
//  eCommerceSwift
//
//  Created by Bonmyeong Koo - Vendor on 6/8/25.
//

import SwiftUI

struct CartView: View {
    @StateObject private var viewModel = CartViewModel()

    var body: some View {
        NavigationView {
            List(viewModel.currentCart?.products ?? []) { cartProduct in
                if let product = viewModel.products[cartProduct.productId] {
                    HStack {
                        ProductView(product: product)
                        Spacer()
                        Text("Qty: \(cartProduct.quantity)")
                    }
                }
            }
            .navigationTitle("Cart")
            .task {
                await viewModel.loadCart()
            }
        }
    }
}

#Preview {
    CartView()
}
