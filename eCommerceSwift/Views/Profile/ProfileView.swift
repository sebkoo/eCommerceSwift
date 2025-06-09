//
//  ProfileView.swift
//  eCommerceSwift
//
//  Created by Bonmyeong Koo - Vendor on 6/8/25.
//

import SwiftUI

struct ProfileView: View {
    @State private var showLogin = false

    var body: some View {
        NavigationView {
            if AuthService.shared.isLoggedIn {
                Button("Logout") {
                    AuthService.shared.logout()
                }
            } else {
                Button("Login") {
                    showLogin = true
                }
            }
        }
        .navigationTitle("Profile")
        .sheet(isPresented: $showLogin) {
            LoginView()
        }
    }
}

#Preview {
    ProfileView()
}
