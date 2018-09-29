//
//  CoreData+CoreDataProperties.swift
//  DocumentsCoreDataCategories
//
//  Created by Liam Flaherty on 9/28/18.
//  Copyright © 2018 Liam Flaherty. All rights reserved.
//
//

import Foundation
import CoreData


extension CoreData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CoreData> {
        return NSFetchRequest<CoreData>(entityName: "CoreData")
    }

    @NSManaged public var dateModCD: NSDate?
    @NSManaged public var fileSizeCD: Int64
    @NSManaged public var name: String?
    @NSManaged public var content: String?
    @NSManaged public var category: Categories?

}
