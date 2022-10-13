//
//  MenuDownloadViewModel.swift
//  Jelly Belly
//
//  Created by J Rogel PhD on 07/10/2022.
//

import Foundation


// Assignment 2 - Retrieve data from the API and printing the amount of data to the console
class MenuItems: ObservableObject {

    enum MenuItemError: Error {
        case invalidResponse
        case invalidURL
        case errorGettingCookies
        case unauthorized
        case notFound
    }

    private let session: URLSession
    private let sessionConfiguration: URLSessionConfiguration

    // Assignment 3 - Handling errors gracefully
    init() {
        self.sessionConfiguration = URLSessionConfiguration.default
        self.session = URLSession(configuration: sessionConfiguration)
    }

    func loadData() async throws {
        // Assignment 4 _ I have added the handling for HTTP in the Info.plist.
        // This means that I can change the url here  to http and still get a response
        guard let url = URL(string: "http://foodbukka.herokuapp.com/api/v1/menu") else {
            // Assignment 3 - Printing informative error messages to the console
            print("Invalid URL")
            throw MenuItemError.invalidURL
        }

        Task {
            do {
                let (data, response) = try await session.data(from: url)

//                guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                if let httpResponse = response as? HTTPURLResponse {
                    // Assignment 3 - Printing informative error messages to the console
                    let code = httpResponse.statusCode
                    switch code {
                    case 200...299:
                        print("Success Code \(code): OK")
                    case 401:
                        print("Error Code \(code): Unauthorized")
                        throw MenuItemError.unauthorized
                    case 404:
                        print("Error Code \(code): Not Found")
                        throw MenuItemError.notFound
                    default:
                        print("Unknown Error \(code)")
                        throw MenuItemError.invalidResponse
                    }
                }
                // Printing the amount of data to the console
                print("Data Downloaded: \(data)")
            } catch {
                print("Error!")
            }
        }
    }

    // Assignment 5 - Getting a cookie from raywenderlich.com
    func getRayCookie() async throws {
        guard let url = URL(string: "https://www.raywenderlich.com") else {
            throw MenuItemError.errorGettingCookies
        }

        do {
            let (_, responseCookie) = try await session.data(from: url)

            guard let httpResponse = responseCookie as? HTTPURLResponse,
                  let fields = httpResponse.allHeaderFields as? [String: String],
                  let cookie = HTTPCookie.cookies(withResponseHeaderFields: fields, for: url).first
            else {
                throw MenuItemError.invalidResponse
            }
            print("Cookie Name: \(cookie.name)")
            print("Cookie Value: \(cookie.value)")
        } catch {
            throw MenuItemError.errorGettingCookies
        }
    }
}
