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

    @NSManaged var endX: NSNumber?
    @NSManaged var endY: NSNumber?
    @NSManaged var startX: NSNumber?
    @NSManaged var startY: NSNumber?
    @NSManaged var patientsCTScanPoints: PatientDetails?
    @NSManaged var patientsNeurologicalDeficits: PatientDetails?
    @NSManaged var patientsManagementPlan: PatientDetails?
    @NSManaged var patientSignature: PatientDetails?
    @NSManaged var patientResidentName: PatientDetails?
    @NSManaged var patientHospitalCourse: PatientDetails?
    @NSManaged var patientOtherInfo: PatientDetails?
    @NSManaged var patientConditionAtDischarge: PatientDetails?
    @NSManaged var patientTreatment: PatientDetails?
    @NSManaged var finalSignaturePatients: PatientDetails?
    @NSManaged var finalNamePatients: PatientDetails?
}
