// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to ToDoData.swift instead.

import CoreData

enum ToDoDataAttributes: String {
    case timeStamp = "timeStamp"
    case title = "title"
}

@objc
class _ToDoData: NSManagedObject {

    // MARK: - Class methods

    class func entityName () -> String {
        return "ToDoData"
    }

    class func entity(managedObjectContext: NSManagedObjectContext!) -> NSEntityDescription! {
        return NSEntityDescription.entityForName(self.entityName(), inManagedObjectContext: managedObjectContext);
    }

    // MARK: - Life cycle methods

    override init(entity: NSEntityDescription, insertIntoManagedObjectContext context: NSManagedObjectContext!) {
        super.init(entity: entity, insertIntoManagedObjectContext: context)
    }

    convenience init(managedObjectContext: NSManagedObjectContext!) {
        let entity = _ToDoData.entity(managedObjectContext)
        self.init(entity: entity, insertIntoManagedObjectContext: managedObjectContext)
    }

    // MARK: - Properties

    @NSManaged
    var timeStamp: NSDate?

    // func validateTimeStamp(value: AutoreleasingUnsafePointer<AnyObject>, error: NSErrorPointer) {}

    @NSManaged
    var title: String?

    // func validateTitle(value: AutoreleasingUnsafePointer<AnyObject>, error: NSErrorPointer) {}

    // MARK: - Relationships

}

