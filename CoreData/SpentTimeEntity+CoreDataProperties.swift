//
//  SpentTimeEntity+CoreDataProperties.swift
//  MyFirstApp
//
//  Created by Florian Mainnemard on 10/02/2021.
//
//

import Foundation
import CoreData


extension SpentTimeEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<SpentTimeEntity> {
        return NSFetchRequest<SpentTimeEntity>(entityName: "SpentTimeEntity")
    }

    @NSManaged public var id: UUID
    @NSManaged public var date: Date
    @NSManaged public var minutes: Int64

}

extension SpentTimeEntity : Identifiable {

}
