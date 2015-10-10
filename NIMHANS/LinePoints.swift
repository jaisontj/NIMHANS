//
//  LinePoints.swift
//  NIMHANS
//
//  Created by Jaison Titus on 10/10/15.
//  Copyright © 2015 foofys. All rights reserved.
//

import Foundation
import CoreData

@objc(LinePoints)
class LinePoints: NSManagedObject {

    @NSManaged var startX: NSNumber?
    @NSManaged var startY: NSNumber?
    @NSManaged var endX: NSNumber?
    @NSManaged var endY: NSNumber?
    @NSManaged var patientsCTScanPoints: PatientDetails?
}
