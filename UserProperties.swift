//
//  UserProperties.swift
//  ProjectOne
//
//  Created by Home on 4/24/21.
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var firstName: String?
    @NSManaged public var lastName: String?
    @NSManaged public var email: String?
    @NSManaged public var password: String?
    @NSManaged public var confirmPassword: String?
}

extension User : Identifiable {

}
