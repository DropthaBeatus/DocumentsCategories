//
//  DataTableViewController.swift
//  DocumentsCoreDataCategories
//
//  Created by Liam Flaherty on 9/28/18.
//  Copyright © 2018 Liam Flaherty. All rights reserved.
//

import UIKit
import CoreData

class DataTableViewController: UITableViewController {

    @IBOutlet var DocumentsTableView: UITableView!
    
    let dateFormatter = DateFormatter()
    var category:Categories?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Text"
        
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .medium
    }
   
    
    func alertNotifyUser(message: String) {
        let alert = UIAlertController(title: "Alert", message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel) {
            (alertAction) -> Void in
            print("OK selected")
        })
        
        self.present(alert, animated: true, completion: nil)
    }
    /*
    func fetchDocuments() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<CoreData> = CoreData.fetchRequest()
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true)] // order results by document name ascending
        
        do {
            documents = try managedContext.fetch(fetchRequest)
        } catch {
            alertNotifyUser(message: "Fetch for documents could not be performed.")
            return
        }
    }
*/
    func deleteDocument(at indexPath: IndexPath) {
        let document = category?.coreData?[indexPath.row]
        
        if let managedObjectContext = document?.managedObjectContext {
            managedObjectContext.delete(document!)
            
            do {
                try managedObjectContext.save()
               // self.category?.coreData.remove(at: indexPath.row)
                DocumentsTableView.deleteRows(at: [indexPath], with: .automatic)
            } catch {
                alertNotifyUser(message: "Delete failed.")
                DocumentsTableView.reloadData()
            }
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return category?.coreData?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath)
    
        if let cell = cell as? DataCoreDocTableViewCell {
            let document = category?.coreData?[indexPath.row]
            cell.DocName.text = document?.name
            cell.DocSize.text = "5" + " bytes"
           
            if let modifiedDate = document?.modifiedDate {
                cell.DocDate.text = dateFormatter.string(from: modifiedDate)
            } else {
                cell.DocDate.text = "unknown"
            }
 
        }
 
        
        return cell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? DocumentViewController else{
            return
        }
            destination.category = category
    }

    @IBAction func Create(_ sender: Any) {
        performSegue(withIdentifier: "Push2", sender: self)
    }
    
    override func viewWillAppear(_ animated: Bool){
        self.DocumentsTableView.reloadData()
        
    }
    
    func deleteDoc(at indexPath: IndexPath){
        guard let category = category?.coreData![indexPath.row],let managedContext = category.managedObjectContext else{
            return
        }
        managedContext.delete(category)
        
        do{
            try managedContext.save()
            
            DocumentsTableView.deleteRows(at: [indexPath], with: .automatic)
        } catch{
            print("Can't delete")
            
         DocumentsTableView.deleteRows(at: [indexPath], with: .automatic)
        }
        
        
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            deleteDoc(at: indexPath)
        }
    }

    

}
