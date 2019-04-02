//
//  Client+CoreDataProperties.swift
//  Shopping
//
//  Created by Alexey Oleksandrovich on 3/29/19.
//  Copyright © 2019 Alexey Oleksandrovich. All rights reserved.
//
//

import Foundation
import CoreData


extension Client {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Client> {
        return NSFetchRequest<Client>(entityName: "Client")
    }

    @NSManaged public var uuid: String?
}
