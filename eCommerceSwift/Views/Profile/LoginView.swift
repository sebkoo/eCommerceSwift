//
//  LoginView.swift
//  eCommerceSwift
//
//  Created by Bonmyeong Koo - Vendor on 6/8/25.
//

import SwiftUI

struct LoginView: View {
    @State private var username = ""
    @State private var password = ""
    @State private var showAlert = false
    @Environment(\.dismiss) var dismiss

    private let productService: ProductServiceProtocol = ProductService()

    var body: some View {
        Form {
            TextField("User Name", text: $username)
            SecureField("Password", text: $password)
            Button("Login") {
                Task {
                    do {
                        let token = try await productService
                            .login(username: username, password: password)
                        AuthService.shared.token = token
                    } catch {
                        showAlert = true
                    }
                }
            }
        }
        .alert("Login Failed", isPresented: $showAlert) {
            Button("OK", role: .cancel) { }
        }
    }
}

#Preview {
    LoginView()
}
