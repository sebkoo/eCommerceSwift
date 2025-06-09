//
//  Cart.swift
//  eCommerceSwift
//
//  Created by Ben Koo on 6/8/25.
//

import Foundation

struct Cart: Codable {
    let id: Int?
    let userId: Int
    let date: String
    var products: [CartProduct]
}

struct CartProduct: Codable, Identifiable {
    let productId: Int
    var quantity: Int
}
