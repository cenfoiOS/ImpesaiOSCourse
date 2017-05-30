// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to CategoryModel.swift instead.

import Foundation
import CoreData

public enum CategoryModelAttributes: String {
    case imageName = "imageName"
    case name = "name"
}

public enum CategoryModelRelationships: String {
    case news = "news"
}

open class _CategoryModel: NSManagedObject {

    // MARK: - Class methods

    open class func entityName () -> String {
        return "CategoryModel"
    }

    open class func entity(managedObjectContext: NSManagedObjectContext) -> NSEntityDescription? {
        return NSEntityDescription.entity(forEntityName: self.entityName(), in: managedObjectContext)
    }

    // MARK: - Life cycle methods

    public override init(entity: NSEntityDescription, insertInto context: NSManagedObjectContext?) {
        super.init(entity: entity, insertInto: context)
    }

    public convenience init?(managedObjectContext: NSManagedObjectContext) {
        guard let entity = _CategoryModel.entity(managedObjectContext: managedObjectContext) else { return nil }
        self.init(entity: entity, insertInto: managedObjectContext)
    }

    // MARK: - Properties

    @NSManaged open
    var imageName: String?

    @NSManaged open
    var name: String?

    // MARK: - Relationships

    @NSManaged open
    var news: NSSet

    open func newsSet() -> NSMutableSet {
        return self.news.mutableCopy() as! NSMutableSet
    }

}

extension _CategoryModel {

    open func addNews(_ objects: NSSet) {
        let mutable = self.news.mutableCopy() as! NSMutableSet
        mutable.union(objects as Set<NSObject>)
        self.news = mutable.copy() as! NSSet
    }

    open func removeNews(_ objects: NSSet) {
        let mutable = self.news.mutableCopy() as! NSMutableSet
        mutable.minus(objects as Set<NSObject>)
        self.news = mutable.copy() as! NSSet
    }

    open func addNewsObject(_ value: NewsModel) {
        let mutable = self.news.mutableCopy() as! NSMutableSet
        mutable.add(value)
        self.news = mutable.copy() as! NSSet
    }

    open func removeNewsObject(_ value: NewsModel) {
        let mutable = self.news.mutableCopy() as! NSMutableSet
        mutable.remove(value)
        self.news = mutable.copy() as! NSSet
    }

}

