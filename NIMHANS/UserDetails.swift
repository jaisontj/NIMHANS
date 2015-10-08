//
//  UserDetails.swift
//  NIMHANS
//
//  Created by Jaison Titus on 07/10/15.
//  Copyright © 2015 foofys. All rights reserved.
//

import Foundation
import CoreData

@objc(UserDetails)
class UserDetails: NSManagedObject {

    @NSManaged var userName: String?
    @NSManaged var userPassword: String?
    @NSManaged var patientInformation: NSSet?

}
