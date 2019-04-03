//
//  ViewController.swift
//  CalendiaryToDoListTrial
//
//  Created by Car Next Door on 3/4/19.
//  Copyright © 2019 David Westerlund. All rights reserved.
//

import UIKit

class ToDoListViewController: UITableViewController {

    let itemArray = ["List 1", "List 2", "List 3"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
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

}

