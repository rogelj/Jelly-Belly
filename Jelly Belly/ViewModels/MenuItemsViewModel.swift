//
//  MenuDownloadViewModel.swift
//  Jelly Belly
//
//  Created by J Rogel PhD on 07/10/2022.
//

import Foundation
import Combine
import SwiftUI

class MenuItems: ObservableObject {

    @Published var myResult = [Result]()
    @Published var myMenuDishes = [Dish]() {
        didSet {
            saveJSONMenu()
            savePListMenu()
        }
    }

    let menuJSONURL = URL(fileURLWithPath: "JellyBellyMenuItems",
                           relativeTo: FileManager.documentsDirectoryURL).appendingPathExtension("json")

    let menyPListURL = URL(fileURLWithPath: "JellyBellyMenuItems",
                            relativeTo: FileManager.documentsDirectoryURL).appendingPathExtension("plist")

    // MARK: - FoodBukkaMenu
    struct FoodBukkaMenu: Codable {
        let totalMenu: Int
        let result: [Result]

        enum CodingKeys: String, CodingKey {
            case totalMenu = "Total Menu"
            case result = "Result"
        }
    }

    // MARK: - Result
    struct Result: Codable {
        let images: [String]
        let id, menuname, resultDescription: String
        let v: Int

        enum CodingKeys: String, CodingKey {
            case images
            case id = "_id"
            case menuname
            case resultDescription = "description"
            case v = "__v"
        }
    }

    enum MenuItemError: Error {
        case invalidResponse
        case invalidURL
        case errorGettingCookies
        case unauthorized
        case notFound
    }

    private let session: URLSession
    private let sessionConfiguration: URLSessionConfiguration

    init() {
        self.sessionConfiguration = URLSessionConfiguration.default
        self.session = URLSession(configuration: sessionConfiguration)
    }

    func loadData() async throws {
        guard let url = URL(string: "http://foodbukka.herokuapp.com/api/v1/menu") else {
            print("Invalid URL")
            throw MenuItemError.invalidURL
        }

        Task {
            do {
                let (data, response) = try await session.data(from: url)

                if let httpResponse = response as? HTTPURLResponse, let decodedResponse = try? JSONDecoder().decode(FoodBukkaMenu.self, from: data)  {
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
                    DispatchQueue.main.async {
                        self.myResult = decodedResponse.result
                        self.myMenuDishes = self.mappingData(dwnLst: self.myResult)
                    }
                }
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

    private func mappingData(dwnLst: [Result]) -> [Dish] {
        print("\(dwnLst)")

        var createdDishes: [Dish] = []
        for res in dwnLst {
            let item = Dish(
                name: res.menuname,
                ingredients: [myIngredients.randomElement()!,
                              myIngredients.randomElement()!,
                              myIngredients.randomElement()!],
                cuisine: DishParts.cuisine[5],
                mealCategory: DishParts.MealCategory.allCases.randomElement()!,
                cost: Double(Double.random(in: 8..<25)).roundNearest(),
                special: Bool.random(),
                discountable: Bool.random(),
                description: res.resultDescription
            )
            print("\(item.name) \(item.mealCategory) \(item.cost)")
            for it in item.ingredients {
                print(it)
            }
            createdDishes.append(item)
        }
        return createdDishes
    }

    // Assignment 2 - Saving to JSON
    private func saveJSONMenu() {
        print(Bundle.main.bundleURL)
        print(FileManager.documentsDirectoryURL)
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted

        do {
            let tasksData = try encoder.encode(myMenuDishes)

            try tasksData.write(to: menuJSONURL, options: .atomicWrite)
        } catch let error {
            print(error)
        }
    }

    // Assignment 3 - Saving to PList
    private func savePListMenu() {
        let encoder = PropertyListEncoder()
        encoder.outputFormat = .xml

        do {
            let tasksData = try encoder.encode(myMenuDishes)

            try tasksData.write(to: menyPListURL, options: .atomicWrite)
        } catch let error {
            print(error)
        }
    }
}

