//
//  ContentView.swift
//  eCommerceSwift
//
//  Created by Ben Koo on 6/8/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            CartView()
                .tabItem {
                    Label("Cart", systemImage: "cart")
                }
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person")
                }
        }
    }
}

#Preview {
    ContentView()
}
