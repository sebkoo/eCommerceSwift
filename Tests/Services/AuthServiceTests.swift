//
//  AuthServiceTests.swift
//  Tests
//
//  Created by Bonmyeong Koo - Vendor on 6/8/25.
//

import Testing
@testable import eCommerceSwift

struct AuthServiceTests {

    @Test func test_authService() {
        let authService = AuthService.shared
        authService.token = "test_token"
        #expect(authService.isLoggedIn == true)
        authService.logout()
        #expect(authService.isLoggedIn == false)
    }
}
