//
//  ViewController.swift
//  UITableViewDemo
//
//  Created by Chhaileng Peng on 12/15/18.
//  Copyright © 2018 Chhaileng Peng. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var data = ["Dara", "Daro", "Sok", "Sao", "Channat", "Chhaileng", "Ratanak"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.tableFooterView = UIView()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell")
        
//        if indexPath.row % 2 == 0 {
//            cell = tableView.dequeueReusableCell(withIdentifier: "tableCell1")
//        }
        
        cell?.textLabel?.text = data[indexPath.row]
        
//        print(indexPath.row)
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(data[indexPath.row])
        let dest = storyboard?.instantiateViewController(withIdentifier: "secondScreen") as! SecondScreenViewController
        dest.text = data[indexPath.row]
        navigationController?.pushViewController(dest, animated: true)
    }
    
//    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
//        let delete = UITableViewRowAction(style: .default, title: "Delete") { (_, indexPath) in
//            print("Delete")
//            self.data.remove(at: indexPath.row)
//            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.left)
//            tableView.reloadData()
//        }
//
//        let edit = UITableViewRowAction(style: .normal, title: "Edit") { (action, indexPath) in
//            print("Edit")
//        }
//
//        return [delete, edit]
//    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let delete = UIContextualAction(style: .destructive, title: "Delete") { (action, view, _) in
            print("Delete")
            self.data.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.left)
            tableView.reloadData()
        }
        delete.image = #imageLiteral(resourceName: "delete")
        delete.backgroundColor = .purple
        
        return UISwipeActionsConfiguration(actions: [delete])
    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let edit = UIContextualAction(style: .destructive, title: nil) { (action, view, _) in
            print("Edit")
        }
        edit.image = #imageLiteral(resourceName: "edit")
        edit.backgroundColor = .gray
        
        return UISwipeActionsConfiguration(actions: [edit])
    }
    


}

