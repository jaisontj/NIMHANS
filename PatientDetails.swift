//
//  PatientDetails.swift
//  NIMHANS
//
//  Created by Jaison Titus on 09/10/15.
//  Copyright © 2015 foofys. All rights reserved.
//

import Foundation
import CoreData

@objc(PatientDetails)
class PatientDetails: NSManagedObject {
    
    @NSManaged var name: String?
    @NSManaged var age: String?
    @NSManaged var gender: String?
    @NSManaged var referredFrom: String?
    @NSManaged var informantName: String?
    @NSManaged var placeOfInjury: String?
    @NSManaged var isRTA: NSNumber?
    @NSManaged var isFall: NSNumber?
    @NSManaged var isOther: NSNumber?
    @NSManaged var isAssault: NSNumber?
    @NSManaged var doctorDetails: UserDetails?

}
