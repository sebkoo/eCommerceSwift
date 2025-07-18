//
//  Product.swift
//  eCommerceSwift
//
//  Created by Bonmyeong Koo - Vendor on 6/8/25.
//

import Foundation

struct Product: Codable, Equatable, Identifiable {
    let id: Int
    let title: String
    let price: Double
    let description: String
    let category: String
    let image: String
}
