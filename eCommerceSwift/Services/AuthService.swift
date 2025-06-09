//
//  AuthService.swift
//  eCommerceSwift
//
//  Created by Bonmyeong Koo - Vendor on 6/8/25.
//

import Foundation

class AuthService {
    static let shared = AuthService()
    private let tokenKey = "authToken"

    var isLoggedIn: Bool { token != nil }
    var token: String? {
        get { UserDefaults.standard.string(forKey: tokenKey) }
        set { UserDefaults.standard.set(newValue, forKey: tokenKey) }
    }

    func logout() {
        UserDefaults.standard.removeObject(forKey: tokenKey)
    }
}
