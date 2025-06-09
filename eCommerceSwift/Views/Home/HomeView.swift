//
//  HomeView.swift
//  eCommerceSwift
//
//  Created by Ben Koo on 6/8/25.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = HomeViewModel()

    var body: some View {
        NavigationView {
            List(viewModel.products) { product in

            }
        }
    }
}

#Preview {
    HomeView()
}
