//
//  Task+CoreDataProperties.swift
//  App06-Todos-CoreData
//
//  Created by Edgar Alexandro on 01/09/22.
//
//

import Foundation
import CoreData


extension Task {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Task> {
        return NSFetchRequest<Task>(entityName: "Task")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var task: String?
    @NSManaged public var due_date: Date?
    @NSManaged public var completed: Bool
    @NSManaged public var priority: Int16
    @NSManaged public var date_created: Date?
    @NSManaged public var category: String?

    var task_wrapped: String{
        task ?? ""
    }
    
    var category_wrapped: String{
        category ?? ""
    }
    
}

extension Task : Identifiable {

}
