//
//  ViewController.swift
//  testingTable
//
//  Created by Jesus Rogel on 11/09/2022.
//

import UIKit

//let jellyColour = UIColor(red: CGFloat(183)/CGFloat(255), green: CGFloat(43)/CGFloat(255), blue: CGFloat(211)/CGFloat(255), alpha: 1)
let bellyColour = UIColor(red: CGFloat(31)/CGFloat(255), green: CGFloat(42)/CGFloat(255), blue: CGFloat(221)/CGFloat(255), alpha: 1)

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!

    let swiftBlogs = ["Ray Wenderlich", "NSHipster", "iOS Developer Tips", "Jameson Quave", "Natasha The Robot", "Coding Explorer", "That Thing In Swift", "Andrew Bancroft", "iAchieved.it", "Airspeed Velocity"]

    var menuItems: [Dish] = dishes

    let textCellIdentifier = "TextCell"
    
    let menuSegueIdentifier = "ShowDetailMenu"

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems.count
//        return swiftBlogs.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: textCellIdentifier, for: indexPath)

        let row = indexPath.row
        cell.textLabel?.text = menuItems[row].name
        cell.imageView?.image = UIImage(named: menuItems[row].name)
        cell.textLabel?.textColor = bellyColour



        return cell
    }


    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        let row = indexPath.row
        print(menuItems[row].name)
//        print(swiftBlogs[row])
    }
    

}


