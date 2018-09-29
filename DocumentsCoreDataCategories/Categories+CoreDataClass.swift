//
//  Categories+CoreDataClass.swift
//  DocumentsCoreDataCategories
//
//  Created by Liam Flaherty on 9/28/18.
//  Copyright © 2018 Liam Flaherty. All rights reserved.
//
//

import UIKit
import CoreData

@objc(Categories)
public class Categories: NSManagedObject {
    var coreData : [CoreData]?{
        return self.rawCoreData?.array as? [CoreData]
    }
    
    convenience init?(category : String){
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        guard let context = appDelegate?.persistentContainer.viewContext
            else{
                return nil
        }
        
        self.init(entity: Categories.entity(), insertInto: context)
        
        self.category = category
    }
}
