//
//  MenuDownloadViewModel.swift
//  Jelly Belly
//
//  Created by J Rogel PhD on 07/10/2022.
//

import Foundation
import Combine
import SwiftUI
import CoreData

protocol SessionMenu {
    func loadJSONMenu()
}

class MenuItems: ObservableObject, SessionMenu {

    @Published var myResult = [Result]()
    @Published var myMenuDishes = [Dish]() {
        didSet {
            saveJSONMenu()
            savePListMenu()
        }
    }

    let menuJSONURL = URL(fileURLWithPath: "JellyBellyMenuItems",
                          relativeTo: FileManager.documentsDirectoryURL.appendingPathComponent("JB")).appendingPathExtension("json")

    let menuPListURL = URL(fileURLWithPath: "JellyBellyMenuItems",
                            relativeTo: FileManager.documentsDirectoryURL.appendingPathComponent("JB")).appendingPathExtension("plist")

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

        if FileManager.SearchPathDirectory.documentDirectory.createSubFolder(named: "JB") {
//            print("folder successfully created")
        }

        // Loading from local JSON file
         loadJSONMenu()

        // Loading form local plist file
        loadPListMenu()
    }


    func loadData(context: NSManagedObjectContext) async throws {
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
                        self.saveData(context: context)
                    }
                }
                print("Data Downloaded: \(data)")
            } catch {
                print("Error!")
            }
        }

    }

    // Part of Assignment 1 - Mapping models
    private func mappingData(dwnLst: [Result]) -> [Dish] {

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
//            print("\(item.name) \(item.mealCategory) \(item.cost)")
//            for it in item.ingredients {
//                print(it)
//            }
            createdDishes.append(item)
        }
        return createdDishes
    }

    // Assignment 2 - Saving to JSON
    private func saveJSONMenu() {
        // Checking for paths being correct 
//        print(Bundle.main.bundleURL)
//        print("Docs directory:")
//        print(FileManager.documentsDirectoryURL)
//        print("file path:")
//        print(menuJSONURL.path)
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted

        do {
            let tasksData = try encoder.encode(myMenuDishes)

            try tasksData.write(to: menuJSONURL, options: .atomicWrite)
        } catch let error {
            print(error)
        }
    }

    internal func loadJSONMenu() {
//        print(Bundle.main.bundleURL)
//        print(FileManager.documentsDirectoryURL)

//        print(temporaryDirectoryURL)
//
//        print((try? FileManager.default.contentsOfDirectory(atPath: FileManager.documentsDirectoryURL.path)) ?? [])

        let decoder = JSONDecoder()

        do {
            let menuData = try Data(contentsOf: menuJSONURL)
            myMenuDishes = try decoder.decode([Dish].self, from: menuData)
        } catch let error {
            print(error)
        }
    }

    // Assignment 2 - Saving to PList
    private func savePListMenu() {
        let encoder = PropertyListEncoder()
        encoder.outputFormat = .xml

        do {
            let tasksData = try encoder.encode(myMenuDishes)

            try tasksData.write(to: menuPListURL, options: .atomicWrite)
        } catch let error {
            print(error)
        }

        // Printing some contents of the JSON file to the console
        for item in myMenuDishes[0...4] {
            item.printDish()
        }
    }

    private func loadPListMenu() {
        guard FileManager.default.fileExists(atPath: menuPListURL.path) else {
            return
        }
        let decoder = PropertyListDecoder()

        do {
            let menuData = try Data(contentsOf: menuPListURL)
            myMenuDishes = try decoder.decode([Dish].self, from: menuData)
        } catch let error {
            print(error)
        }

        // Printing some contents of the PList to the console
        for item in myMenuDishes[0...4] {
            item.printDish()
        }
    }

    // Assignment 3 Saving JSON info to Core data

    func saveData(context: NSManagedObjectContext) {
        myMenuDishes.forEach { (data) in
            let entity = DishEntity(context: context)
            entity.name = data.name
            entity.dishDescription = data.description
            entity.cost = data.cost
            entity.cuisine = data.cuisine
            entity.special = data.special ?? false
            entity.discountable = data.discountable ?? false
        }

        // saving all pending data
        do {
            try context.save()
            print("Success saving JSON to core data")
        } catch {
            print("Error saving JSON to core data")
            print(error.localizedDescription)
        }
    }
}

