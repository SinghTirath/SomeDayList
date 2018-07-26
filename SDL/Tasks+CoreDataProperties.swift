//
//  Tasks+CoreDataProperties.swift
//  SDL
//
//  Created by Tirath on 2018-04-05.
//  Copyright © 2018 Tirath. All rights reserved.
//
//

import Foundation
import CoreData


extension Tasks {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Tasks> {
        return NSFetchRequest<Tasks>(entityName: "Tasks")
    }

    @NSManaged public var name: NSObject?
    @NSManaged public var note: NSObject?
    @NSManaged public var date: NSObject?

}
