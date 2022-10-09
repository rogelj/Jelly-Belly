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
            let (data, response) = try await session.data(from: url)

            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                // Assignment 3 - Printing informative error messages to the console
                print("Error!")
                throw MenuItemError.invalidResponse

            }
            // Printing the amount of data to the console
            print("Data Downloaded: \(data)")
        }
    }
}
