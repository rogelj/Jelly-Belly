//
//  TSwift.swift
//  Jelly Belly
//
//  Created by J Rogel PhD on 13/10/2022.
//

import Foundation
import SwiftUI

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

struct MenuAPIView: View {
    @State var myResult = [Result]()

    var body: some View {
        List(myResult, id: \.id) { item in
            VStack(alignment: .leading) {
                Text(item.menuname)
                    .font(.headline)
                Text(item.resultDescription)
            }
        }
        .task {
            await loadData()
        }
    }

    func loadData() async {

        guard let url = URL(string: "https://foodbukka.herokuapp.com/api/v1/menu") else {
            print("Invalid URL")
            return
        }
        Task {
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                if let decodedResponse = try? JSONDecoder().decode(FoodBukkaMenu.self, from: data) {
                    myResult = decodedResponse.result
                    print("\(myResult)")
                }
                print("Downloaded Data: \(data)")
            }
            catch {
                print("Invalid data")
            }
        }
    }
}

struct MenuAPIView_Previews: PreviewProvider {
    static var previews: some View {
        MenuAPIView()
    }
}
