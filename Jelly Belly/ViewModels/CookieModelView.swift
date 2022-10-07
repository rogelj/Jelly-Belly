//
//  MenuDownloadViewModel.swift
//  Jelly Belly
//
//  Created by J Rogel PhD on 07/10/2022.
//

import Foundation
import SwiftUI

class CookieItems: ObservableObject {
    @State private var cookieName: String?
    @State private var cookieValue: String?

    enum CookieItemError: Error {
        case invalidResponse
        case invalidURL
    }

    private let session: URLSession
    private let sessionConfiguration: URLSessionConfiguration

    init() {
        self.sessionConfiguration = URLSessionConfiguration.default
        self.session = URLSession(configuration: sessionConfiguration)
    }

    func getCookie() async throws {
        func setCookies(name: String? = nil, value: String? = nil) {
            Task { @MainActor in
                cookieName = name ?? "N/A"
                cookieValue = value ?? "N/A"
            }
        }

        guard let url = URL(string: "https://apple.com") else {
            setCookies()
            return
        }

        do {
            let (_, response) = try await URLSession.shared.data(from: url)

            guard let httpResponse = response as? HTTPURLResponse,
                  let fields = httpResponse.allHeaderFields as? [String: String],
                  let cookie = HTTPCookie.cookies(withResponseHeaderFields: fields, for: url).first
            else {
                setCookies()

                return
            }

            setCookies(name: cookie.name, value: cookie.value)

            var cookieProperties: [HTTPCookiePropertyKey: Any] = [:]
            cookieProperties[.name] = cookie.name
            cookieProperties[.value] = cookie.value
            cookieProperties[.domain] = cookie.domain

            if let myCookie = HTTPCookie(properties: cookieProperties) {
                HTTPCookieStorage.shared.setCookie(myCookie)
                HTTPCookieStorage.shared.deleteCookie(cookie)
            }
            print("Cookie name: \(cookieName ?? "-")")
            print("Cookie value: \(cookieValue ?? "-")")
        } catch {
            setCookies()
        }
    }
}
