// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to NewsModel.swift instead.

import Foundation
import CoreData

public enum NewsModelAttributes: String {
    case createdAt = "createdAt"
    case descriptionNews = "descriptionNews"
    case title = "title"
}

public enum NewsModelRelationships: String {
    case category = "category"
}

open class _NewsModel: NSManagedObject {

    // MARK: - Class methods

    open class func entityName () -> String {
        return "NewsModel"
    }

    open class func entity(managedObjectContext: NSManagedObjectContext) -> NSEntityDescription? {
        return NSEntityDescription.entity(forEntityName: self.entityName(), in: managedObjectContext)
    }

    // MARK: - Life cycle methods

    public override init(entity: NSEntityDescription, insertInto context: NSManagedObjectContext?) {
        super.init(entity: entity, insertInto: context)
    }

    public convenience init?(managedObjectContext: NSManagedObjectContext) {
        guard let entity = _NewsModel.entity(managedObjectContext: managedObjectContext) else { return nil }
        self.init(entity: entity, insertInto: managedObjectContext)
    }

    // MARK: - Properties

    @NSManaged open
    var createdAt: Date?

    @NSManaged open
    var descriptionNews: String?

    @NSManaged open
    var title: String?

    // MARK: - Relationships

    @NSManaged open
    var category: CategoryModel?

}

