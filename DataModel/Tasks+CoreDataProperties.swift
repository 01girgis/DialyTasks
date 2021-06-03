//
//  Tasks+CoreDataProperties.swift
//  DailyTask
//
//  Created by crus on 5/31/21.
//
//

import Foundation
import CoreData


extension Tasks {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Tasks> {
        return NSFetchRequest<Tasks>(entityName: "Tasks")
    }

    @NSManaged public var taskText: String?

}

extension Tasks : Identifiable {

}
