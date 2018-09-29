//
//  CateViewController.swift
//  DocumentsCoreDataCategories
//
//  Created by Liam Flaherty on 9/28/18.
//  Copyright © 2018 Liam Flaherty. All rights reserved.
//

import UIKit

class CateViewController: UIViewController {

    @IBOutlet weak var CateText: UITextField!
    
    @IBAction func Save(_ sender: Any) {
        let category = Categories(category: CateText.text!)
        do{
            try category?.managedObjectContext?.save()
            self.navigationController?.popViewController(animated: true)
        }catch{
            print("Could not save category")
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


}
