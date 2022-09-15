//
//  ViewController.swift
//
//  Created by J Rogel PhD on 09/09/2022.
//
//

import UIKit
import SwiftUI
import Combine


class ViewController: UIViewController {

    var menuItems = dishes

    var tableView = UITableView()
    var selectedItemName: Dish = Dish(name: "", ingredients: [], cuisine: "", mealType: ("", ""), cost: 0.0)

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self

        title = "Jelly Belly Menu"
        view = tableView
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.selectionStyle = .none
        cell.textLabel?.text = "\(menuItems[indexPath.row].name)"
        cell.textLabel?.textColor = bellyColour
        cell.imageView?.image = UIImage(named: menuItems[indexPath.row].name)
        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems.count
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // UIKit > SwiftUI
        selectedItemName = menuItems[indexPath.row]
        let vc = UIHostingController(rootView: MenuDetailedView(dish: selectedItemName))
        self.present(vc, animated: true)
    }
}
