//
//  eCommerceSwiftApp.swift
//  eCommerceSwift
//
//  Created by Ben Koo on 6/8/25.
//

import SwiftUI
import Stripe

@main
struct eCommerceSwiftApp: App {
    init() {
        StripeAPI.defaultPublishableKey = "pk_test_..."
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
