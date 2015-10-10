//
//  PatientDetails.swift
//  NIMHANS
//
//  Created by Jaison Titus on 10/10/15.
//  Copyright © 2015 foofys. All rights reserved.
//

import Foundation
import CoreData

@objc(PatientDetails)
class PatientDetails: NSManagedObject {

    @NSManaged var abdominalInjury: NSNumber?
    @NSManaged var activePeripheralBleeding: NSNumber?
    @NSManaged var age: String?
    @NSManaged var amnesia: NSNumber?
    @NSManaged var bleedingFromEar: NSNumber?
    @NSManaged var bleedingFromNose: NSNumber?
    @NSManaged var bpAfterHalfHour: String?
    @NSManaged var bpOnArrival: String?
    @NSManaged var chestInjury: NSNumber?
    @NSManaged var csf: NSNumber?
    @NSManaged var ctScanHour: String?
    @NSManaged var didLoseConsciousness: NSNumber?
    @NSManaged var didLucidDream: NSNumber?
    @NSManaged var fractures: NSNumber?
    @NSManaged var gcsChangeNo: NSNumber?
    @NSManaged var gcsChangeYes: NSNumber?
    @NSManaged var gender: String?
    @NSManaged var informantName: String?
    @NSManaged var isAssault: NSNumber?
    @NSManaged var isDriver: NSNumber?
    @NSManaged var isEyewitness: NSNumber?
    @NSManaged var isFall: NSNumber?
    @NSManaged var isHearsay: NSNumber?
    @NSManaged var isOther: NSNumber?
    @NSManaged var isPassenger: NSNumber?
    @NSManaged var isPedestrian: NSNumber?
    @NSManaged var isRTA: NSNumber?
    @NSManaged var name: String?
    @NSManaged var otorrhoea: NSNumber?
    @NSManaged var peripheralPulses: NSNumber?
    @NSManaged var placeOfInjury: String?
    @NSManaged var pulseRatePerMin: String?
    @NSManaged var referredFrom: String?
    @NSManaged var siezures: NSNumber?
    @NSManaged var spineDeformity: NSNumber?
    @NSManaged var spineTenderness: NSNumber?
    @NSManaged var vomiting: NSNumber?
    @NSManaged var wounds: NSNumber?
    @NSManaged var timeOfInjury: String?
    @NSManaged var timeOfExamination: String?
    @NSManaged var dateOfInjury: String?
    @NSManaged var dateOfExamination: String?
    @NSManaged var nsMon: NSNumber?
    @NSManaged var nsWed: NSNumber?
    @NSManaged var nsFri: NSNumber?
    @NSManaged var helmet: String?
    @NSManaged var alcohol: String?
    @NSManaged var airway: String?
    @NSManaged var respiration: String?
    @NSManaged var carotidPulsations: String?
    @NSManaged var eoScoreInitial: String?
    @NSManaged var eoScoreAfter: String?
    @NSManaged var mrScoreInitial: String?
    @NSManaged var mrScoreAfter: String?
    @NSManaged var vrScoreInitial: String?
    @NSManaged var vrScoreAfter: String?
    @NSManaged var totalInitial: String?
    @NSManaged var totalAfter: String?
    @NSManaged var horRight: String?
    @NSManaged var horLeft: String?
    @NSManaged var plrRightmm: String?
    @NSManaged var plrRight: String?
    @NSManaged var plrLeftmm: String?
    @NSManaged var plrLeft: String?
    @NSManaged var mseUpperRightTone: String?
    @NSManaged var mseUpperLeftTone: String?
    @NSManaged var mseUpperRightPower: String?
    @NSManaged var mseUpperLeftPower: String?
    @NSManaged var mseLowerRightTone: String?
    @NSManaged var mseLowerLeftTone: String?
    @NSManaged var mseLowerRightPower: String?
    @NSManaged var mseLowerLeftPower: String?
    @NSManaged var changesInGCS: String?
    @NSManaged var finalTime: String?
    @NSManaged var finalDate: String?
    @NSManaged var followUpMon: NSNumber?
    @NSManaged var followUpWed: NSNumber?
    @NSManaged var followUpFri: NSNumber?
    @NSManaged var ctScanPoints: NSSet?
    @NSManaged var doctorDetails: UserDetails?
    @NSManaged var neurologicalDefectsPoints: NSSet?
    @NSManaged var managementPlan: NSSet?
    @NSManaged var signature: NSSet?
    @NSManaged var residentName: NSSet?
    @NSManaged var hospitalCourse: NSSet?
    @NSManaged var otherRelevantInfo: NSSet?
    @NSManaged var conditionAtDischarge: NSSet?
    @NSManaged var treatmentPoints: NSSet?
    @NSManaged var finalSignature: NSSet?
    @NSManaged var finalName: NSSet?
}
