//
//  Categories+CoreDataProperties.swift
//  DocumentsCoreDataCategories
//
//  Created by Liam Flaherty on 9/28/18.
//  Copyright © 2018 Liam Flaherty. All rights reserved.
//
//

import Foundation
import CoreData


extension Categories {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Categories> {
        return NSFetchRequest<Categories>(entityName: "Categories")
    }

    @NSManaged public var category: String?
    @NSManaged public var rawCoreData: NSOrderedSet?

}

// MARK: Generated accessors for rawCoreData
extension Categories {

    @objc(insertObject:inRawCoreDataAtIndex:)
    @NSManaged public func insertIntoRawCoreData(_ value: CoreData, at idx: Int)

    @objc(removeObjectFromRawCoreDataAtIndex:)
    @NSManaged public func removeFromRawCoreData(at idx: Int)

    @objc(insertRawCoreData:atIndexes:)
    @NSManaged public func insertIntoRawCoreData(_ values: [CoreData], at indexes: NSIndexSet)

    @objc(removeRawCoreDataAtIndexes:)
    @NSManaged public func removeFromRawCoreData(at indexes: NSIndexSet)

    @objc(replaceObjectInRawCoreDataAtIndex:withObject:)
    @NSManaged public func replaceRawCoreData(at idx: Int, with value: CoreData)

    @objc(replaceRawCoreDataAtIndexes:withRawCoreData:)
    @NSManaged public func replaceRawCoreData(at indexes: NSIndexSet, with values: [CoreData])

    @objc(addRawCoreDataObject:)
    @NSManaged public func addToRawCoreData(_ value: CoreData)

    @objc(removeRawCoreDataObject:)
    @NSManaged public func removeFromRawCoreData(_ value: CoreData)

    @objc(addRawCoreData:)
    @NSManaged public func addToRawCoreData(_ values: NSOrderedSet)

    @objc(removeRawCoreData:)
    @NSManaged public func removeFromRawCoreData(_ values: NSOrderedSet)

}
