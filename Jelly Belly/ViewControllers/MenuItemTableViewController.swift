//
//  MenuItemTableViewController.swift
//  Jelly Belly
//
//  Created by J Rogel PhD on 09/09/2022.
//

import UIKit
import SwiftUI

// Used fof the TableViewController in the Main.stroyboard file
class MenuItemTableViewController: UITableViewController {

    var menuItems: [Dish] = dishes

    override func viewDidLoad() {
        super.viewDidLoad()

        // Using my test data here
//        menuItems = dishes

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return menuItems.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuItemCell", for: indexPath)
        cell.textLabel?.text = "\(menuItems[indexPath.row].name)"
//        cell.imageView?.image = UIImage(named: "JellyBelly")
        cell.imageView?.image = UIImage(named: menuItems[indexPath.row].name)
        return cell
    }

}

struct MenuItemTableRepresentable: UIViewRepresentable {
    @Binding var menuStoryIsShowing: Bool
    
    func makeUIView(context: Context) -> UIView {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let tbView = storyboard.instantiateInitialViewController()
        if let image = tbView {
            return image.view
        } else {
            return UIView()
        }
    }
    func updateUIView(_ view: UIView, context: Context) {
        //do your logic here
    }
}

//
