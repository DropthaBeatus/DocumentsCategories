//
//  CategoriesTableViewController.swift
//  DocumentsCoreDataCategories
//
//  Created by Liam Flaherty on 9/28/18.
//  Copyright © 2018 Liam Flaherty. All rights reserved.
//

import UIKit
import CoreData

class CategoriesTableViewController: UITableViewController {
    
    @IBOutlet var cateTable: UITableView!
    
    
    var categories: [Categories] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return categories.count
    }

    public override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CategoryTableViewCell
        
        cell.categoryLabel.text = categories[indexPath.row].category
        return cell
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else{
            return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<Categories> = Categories.fetchRequest()
        
        do{
            categories = try managedContext.fetch(fetchRequest)
            
            cateTable.reloadData()
        } catch {
            print("Could not fetch categories")
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Push", let destination = segue.destination as? DataTableViewController,
            let row = cateTable.indexPathForSelectedRow?.row {
           
            destination.category = categories[row]
            destination.Categor = categories
        }
        
    }
    
    func deleteCategory(at indexPath: IndexPath){
        let category = categories[indexPath.row]
        
        guard let managedContext = category.managedObjectContext else{
            return
        }
        managedContext.delete(category
        )
        
        do{
            try managedContext.save()
            categories.remove(at: indexPath.row)
            
            cateTable.deleteRows(at: [indexPath], with: .automatic)
        } catch{
            print("Can't delete")
            
            cateTable.reloadRows(at: [indexPath], with: .automatic)
        }
        
        
    }
    
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            deleteCategory(at: indexPath)
        }
    }



}
