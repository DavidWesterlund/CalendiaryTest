//
//  ViewController.swift
//  CalendiaryToDoListTrial
//
//  Created by Car Next Door on 3/4/19.
//  Copyright © 2019 David Westerlund. All rights reserved.
//

import UIKit

class ToDoListViewController: UITableViewController {

    let defaults = UserDefaults.standard
    
    
    var itemArray = ["List 1", "List 2", "List 3"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let items = defaults.array(forKey: "CalendoListArray") as? [String] {
            itemArray = items
        }

    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        cell.textLabel?.text = itemArray[indexPath.row]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        }
        else {tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }

        //print(itemArray[indexPath.row])
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    //MARK - Add new items
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New Calendo Item", message: "", preferredStyle: .alert)
     
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            //What will happen once the user has pressed the ADD ITEM alert on UIAlert
            self.itemArray.append(textField.text!)
            self.defaults.set(self.itemArray, forKey: "CalendoListArray")
            
            self.tableView.reloadData()
            
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create New Item"
            textField = alertTextField
        }
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
    }
    
}

