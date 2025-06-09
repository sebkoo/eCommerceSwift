//
//  PaymentService.swift
//  eCommerceSwift
//
//  Created by Bonmyeong Koo - Vendor on 6/9/25.
//

import Foundation

class PaymentService {
    private let secretKey = "sk_test_..."

    func createPaymentIntent(amount: Int, currency: String) async throws -> String {
        let url = URL(string: "https://api.stripe.com/v1/payment_intents")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("Bearer \(secretKey)", forHTTPHeaderField: "Authorization")
        let parameters = "amount=\(amount)&currency=\(currency)"
        request.httpBody = parameters.data(using: .utf8)

        let (data, _) = try await URLSession.shared.data(for: request)
        let json = try JSONSerialization.jsonObject(with: data) as! [String: Any]
        return json["client_secret"] as! String
    }
}
