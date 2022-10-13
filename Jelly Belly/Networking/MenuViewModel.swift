//
//  MenuViewModel.swift
//  Jelly Belly
//
//  Created by J Rogel PhD on 13/10/2022.
//

//import Foundation
//
//class apiCall {
//    func getMenu(completion:@escaping ([Menu]) -> ()) {
//        guard let url = URL(string: "https://foodbukka.herokuapp.com/api/v1/menu") else { return }
//
//        URLSession.shared.dataTask(with: url) { (data, _, _) in
//            let menu = try! JSONDecoder().decode([Menu].self, from: data!)
//            print(menu)
//
//            DispatchQueue.main.async {
//                completion(menu)
//            }
//        }
//        .resume()
//    }
//}
