//
//  MenuItemTableViewController.swift
//  Jelly Belly
//
//  Created by J Rogel PhD on 09/09/2022.
//

import UIKit
import SwiftUI

class MenuItemTableViewController: UITableViewController {
    
    var menuItems = [Dish]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Using my test data here
        menuItems = dishes

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        menuItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuItemCell", for: indexPath)
        cell.textLabel?.text = "\(menuItems[indexPath.row].name)"
        return cell
    }

}

struct MenuItemTableRepresentable: UIViewRepresentable {
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
