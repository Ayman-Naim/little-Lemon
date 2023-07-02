//
//  Dish+CoreDataProperties.swift
//  Little-Lemon-Food-Ordering-App
//
//  Created by ayman on 02/07/2023.
//
//

import Foundation
import CoreData


extension Dish {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Dish> {
        return NSFetchRequest<Dish>(entityName: "Dish")
    }

    @NSManaged public var title: String?
    @NSManaged public var descrioption: String?
    @NSManaged public var price: String?
    @NSManaged public var category: String?
    @NSManaged public var image: String?

}

extension Dish : Identifiable {

}
