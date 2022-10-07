

import SwiftUI

// MARK: Cookie View
struct CookieView: View  {
    // MARK: Properties
    @State private var cookieName: String?
    @State private var cookieValue: String?



    // MARK: Body
    var body: some View {
        VStack {
            Image(systemName: "mouth")
                .resizable()
                .frame(maxWidth: 120, maxHeight: 70)
                .padding(.bottom, 20)

            Text("Cookie name: \(cookieName ?? "-")")
                .padding(.top, 20)
            Text("Cookie value: \(cookieValue ?? "-")")
                .padding(.bottom, 20)

            Button("Get Cookies") {
                Task {
                    try await getCookiesTapped()
                }
            }
        }
    }

    // MARK: Functions
    func getCookiesTapped() async throws {
        func setCookies(name: String? = nil, value: String? = nil) {
            Task { @MainActor in
                cookieName = name ?? "N/A"
                cookieValue = value ?? "N/A"
            }
        }

        guard let url = URL(string: "https://raywenderlich.com") else {
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

        } catch {
            setCookies()

        }

    }
}

// MARK: - Preview Provider
struct CookieView_Previews: PreviewProvider {
    // MARK: Previews
    static var previews: some View {
        CookieView()
    }
}
