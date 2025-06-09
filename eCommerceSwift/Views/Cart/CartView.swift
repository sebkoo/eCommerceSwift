//
//  CartView.swift
//  eCommerceSwift
//
//  Created by Bonmyeong Koo - Vendor on 6/8/25.
//

import SwiftUI
import StripePaymentSheet

struct CartView: View {
    @StateObject private var viewModel = CartViewModel()
    @State private var paymentSheet: PaymentSheet?
    @State private var showPayment = false
    private let paymentService = PaymentService()

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
            Button("Checkout") {
                Task {
                    do {
                        let total = 1000    // Placeholder: $10
                        let clientSecret = try await paymentService
                            .createPaymentIntent(amount: total, currency: "usd")
                        paymentSheet = PaymentSheet(paymentIntentClientSecret: clientSecret, configuration: .init())
                        showPayment = true
                    } catch {
                        print("Payment error: \(error)")
                    }
                }
            }
        }
        .navigationTitle("Cart")
        .task {
            await viewModel.loadCart()
        }
        .sheet(isPresented: $showPayment) {
            if let paymentSheet = paymentSheet {
                PaymentSheetView(
            }
        }
    }
}

#Preview {
    CartView()
}
