//
//  MenuLister.swift
//  Jelly Belly
//
//  Created by J Rogel PhD on 09/09/2022.
//

import SwiftUI

class HostingCell: UITableViewCell { // just to hold hosting controller
    var host: UIHostingController<AnyView>?
}

struct UIList: UIViewRepresentable {
    
    var rows: [Dish]
    
//    let jellyColour = UIColor(red: CGFloat(183)/CGFloat(255), green: CGFloat(43)/CGFloat(255), blue: CGFloat(211)/CGFloat(255), alpha: 1)
    
    func makeUIView(context: Context) -> UITableView {
        let collectionView = UITableView(frame: .zero, style: .plain)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.dataSource = context.coordinator
        collectionView.delegate = context.coordinator
        collectionView.register(HostingCell.self, forCellReuseIdentifier: "Cell")
        return collectionView
    }
    
    func updateUIView(_ uiView: UITableView, context: Context) {
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(rows: rows)
    }
    
    class Coordinator: NSObject, UITableViewDataSource, UITableViewDelegate {
        
        var rows: [Dish]
        
        init(rows: [Dish]) {
            self.rows = rows
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            self.rows.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            let tableViewCell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! HostingCell
            
            let view = Text(rows[indexPath.row].mealType.1 + " " + rows[indexPath.row].name)
                .frame(height: 50)
                .padding(.leading)
                .foregroundColor(Color("Belly"))
            
            // create & setup hosting controller only once
            if tableViewCell.host == nil {
                let controller = UIHostingController(rootView: AnyView(view))
                tableViewCell.host = controller
                
                let tableCellViewContent = controller.view!
                tableCellViewContent.translatesAutoresizingMaskIntoConstraints = false
                tableViewCell.contentView.addSubview(tableCellViewContent)
                tableCellViewContent.topAnchor.constraint(equalTo: tableViewCell.contentView.topAnchor).isActive = true
                tableCellViewContent.leftAnchor.constraint(equalTo: tableViewCell.contentView.leftAnchor).isActive = true
                tableCellViewContent.bottomAnchor.constraint(equalTo: tableViewCell.contentView.bottomAnchor).isActive = true
                tableCellViewContent.rightAnchor.constraint(equalTo: tableViewCell.contentView.rightAnchor).isActive = false
            } else {
                // reused cell, so just set other SwiftUI root view
                tableViewCell.host?.rootView = AnyView(view)
            }
            tableViewCell.setNeedsLayout()
            return tableViewCell
        }
    }
}
