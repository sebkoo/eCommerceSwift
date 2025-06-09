//
//  PaymentView.swift
//  eCommerceSwift
//
//  Created by Bonmyeong Koo - Vendor on 6/9/25.
//

import SwiftUI
import StripePaymentSheet

struct PaymentView: View {
    let paymentSheet: PaymentSheet
    let onCompletion: (PaymentSheetResult) -> Void  // Use PaymentSheetResult

    func makeUIViewController(context: UIViewControllerRepresentableContext<PaymentView>) -> UIViewController {
        let viewController = UIViewController()
        return viewController
    }

    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    PaymentView()
}
