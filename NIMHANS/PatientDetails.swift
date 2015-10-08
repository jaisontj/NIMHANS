//
//  PatientDetails.swift
//  NIMHANS
//
//  Created by Jaison Titus on 07/10/15.
//  Copyright © 2015 foofys. All rights reserved.
//

import Foundation
import CoreData

@objc(PatientDetails)
class PatientDetails: NSManagedObject {
    
    @NSManaged var name: String?
    @NSManaged var doctorDetails: UserDetails?

}
