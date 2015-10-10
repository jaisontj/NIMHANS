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

    @NSManaged var name: String?
    @NSManaged var age: String?
    @NSManaged var gender: String?

    @NSManaged var didLoseConsciousness: NSNumber?
    @NSManaged var didLucidDream: NSNumber?
    @NSManaged var informantName: String?
    @NSManaged var isAlcoholNo: NSNumber?
    @NSManaged var isAlcoholYes: NSNumber?
    @NSManaged var isAssault: NSNumber?
    @NSManaged var isDriver: NSNumber?
    @NSManaged var isEyewitness: NSNumber?
    @NSManaged var isFall: NSNumber?
    @NSManaged var isHearsay: NSNumber?
    @NSManaged var isHelmetNo: NSNumber?
    @NSManaged var isHelmetYes: NSNumber?
    @NSManaged var isOther: NSNumber?
    @NSManaged var isPassenger: NSNumber?
    @NSManaged var isPedestrian: NSNumber?
    @NSManaged var isRTA: NSNumber?
    @NSManaged var placeOfInjury: String?
    @NSManaged var referredFrom: String?
    @NSManaged var siezures: NSNumber?
    @NSManaged var vomiting: NSNumber?
    @NSManaged var amnesia: NSNumber?
    @NSManaged var bleedingFromEar: NSNumber?
    @NSManaged var bleedingFromNose: NSNumber?
    @NSManaged var clearAirway: NSNumber?
    @NSManaged var intubationAirway: NSNumber?
    @NSManaged var normalRespiration: NSNumber?
    @NSManaged var tachypnoenicRespiration: NSNumber?
    @NSManaged var gaspingRespiration: NSNumber?
    @NSManaged var pulseRatePerMin: String?
    @NSManaged var leftCarotidPulsation: NSNumber?
    @NSManaged var bpOnArrival: String?
    @NSManaged var bpAfterHalfHour: String?
    @NSManaged var csf: NSNumber?
    @NSManaged var otorrhoea: NSNumber?
    @NSManaged var activePeripheralBleeding: NSNumber?
    @NSManaged var fractures: NSNumber?
    @NSManaged var peripheralPulses: NSNumber?
    @NSManaged var chestInjury: NSNumber?
    @NSManaged var abdominalInjury: NSNumber?
    @NSManaged var wounds: NSNumber?
    @NSManaged var spineTenderness: NSNumber?
    @NSManaged var spineDeformity: NSNumber?
    @NSManaged var gcsChangeYes: NSNumber?
    @NSManaged var gcsChangeNo: NSNumber?
    @NSManaged var ctScanHour: String?
    @NSManaged var doctorDetails: UserDetails?
}
