//
//  ProductView.swift
//  eCommerceSwift
//
//  Created by Bonmyeong Koo - Vendor on 6/8/25.
//

import SwiftUI

struct ProductView: View {
    let product: Product

    var body: some View {
        HStack {
            AsyncImage(url: URL(string: product.image)) { image in
                image.resizable().scaledToFit()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 50, height: 50)
            VStack(alignment: .leading) {
                Text(product.title).font(.headline)
                Text("$\(product.price, specifier: "%.2f")").font(.subheadline)
            }
        }
    }
}

#Preview {
    ProductView(product: Product(
        id: 1,
        title: "Test",
        price: 100.99,
        description: "description",
        category: "Category",
        image: ""))
}
