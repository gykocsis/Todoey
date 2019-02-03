//
//  ViewController.swift
//  Todoey
//
//  Created by Kocsis György on 2019. 01. 31..
//  Copyright © 2019. Jolakotturinn. All rights reserved.
//

import UIKit

class ToDoListViewController: UITableViewController {
    
    var itemArray = [Item]()
    
    let defaults = UserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        if let items = defaults.stringArray(forKey: "TodoListArray") {
//            itemArray = items

//
//        }
        
        let newItem1 = Item()
        newItem1.title = "kresz"
        itemArray.append(newItem1)

        let newItem2 = Item()
        newItem2.title = "teszt"
        newItem2.done = true
        itemArray.append(newItem2)
    }
    
    //MARK - TableView Datasource Methods
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        let item = itemArray[indexPath.row]
        
        cell.textLabel?.text = item.title
        cell.accessoryType = item.done ? .checkmark : .none
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    //MARK - TableView Delegate Methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        
        tableView.reloadData()

        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // MARK - Add new items
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Add new todoey item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            
            let newItem = Item()
            newItem.title = alert.textFields![0].text!
            print(newItem.title)
            self.itemArray.append(newItem)
            self.defaults.set(self.itemArray, forKey: "TodoListArray")
            self.tableView.reloadData()
            print(self.itemArray.count)
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new item"
        }
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
    }
 
    
}

