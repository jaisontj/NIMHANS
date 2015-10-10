//
//  PatientInformation.swift
//  NIMHANS
//
//  Created by Jaison Titus on 07/10/15.
//  Copyright © 2015 foofys. All rights reserved.
//

import Foundation

class PatientInformation {
    
    //Patient details
    
    var name: String?
    var age: String?
    var gender: String?
    var referredFrom: String?
    var informantName: String?
    var placeOfInjury: String?
    var wasEyewithnessPresent: Bool?
    var isHearsay: Bool?
    var timeOfInjury: String?
    var timeOfExamination: String?
    var dateOfInjury: String?
    var dateOfExamination: String?
    
    //OPD
    
    var ns1Monday: Bool?
    var ns2Wednesday: Bool?
    var ns3Friday: Bool?
    
    //History of injury in detail
    
    
    var isRTA: Bool?
    var isFall: Bool?
    var isOther: Bool?
    var isAssault: Bool?
    
    var isDriver: Bool?
    var isPedestrian: Bool?
    var isPassenger: Bool?
    var helmet: String?
    var alcohol: String?
    
    //History following trauma
    
    var didLoseConsciousness: Bool?
    var didHaveLucidInterval: Bool?
    var didHaveSeizures: Bool?
    var didVomit: Bool?
    var hasAmnesia: Bool?
    var isBleedingFromEar: Bool?
    var isBleedingFromNose: Bool?
    
    
    //Vital signs on arrival
    
    var airway: String?
    var respiration: String?
    var carotidPulsations: String?
    var pulseRatePerMin: String?
    var bpOnArrival: String?
    var bpAfterHalfHour: String?
    
    
    //Details of systematic examination
    
    
    var csfRhin: Bool?
    var otorrhoea: Bool?
    var activePeripheralBleeding: Bool?
    var fractures: Bool?
    var peripheralPulses: Bool?
    var chestInjury: Bool?
    var abdominalInjury: Bool?
    var wounds: Bool?
    
    
    //Details of spine examination
    var spineTenderness: Bool?
    var spineDeformity: Bool?
    
    //Neurological Examination
    
    var eoScoreInitial: String?
    var eoScoreAfter: String?
    
    var mrScoreInitial: String?
    var mrScoreAfter: String?
    
    
    var vrScoreInitial: String?
    var vrScoreAfter: String?
    
    var totalInitial: String?
    var totalAfter: String?
    
    var horRight: String?
    
    var horLeft: String?
    
    var plrRightmm: String?
    var plrRight:String?
    
    
    var plrLeftmm: String?
    var plrLeft: String?
    
    var mseUpperRightTone: String?
    var mseUpperLeftTone: String?
    var mseUpperRightPower: String?
    var mseUpperLeftPower: String?
    
    
    var mseLowerRightTone: String?
    var mseLowerLeftTone: String?
    var mseLowerRightPower: String?
    var mseLowerLeftPower: String?
    
    //Clinical Impressions
    var changesInGCS: String?
    var ctScanHours: String?
    
    //Draw Views
    
    var ctScanPoints = [Points]()
    var otherNeurologicalDeficits = [Points]()
    var managementPlanPoints = [Points]()
    var signature = [Points]()
    var residentName = [Points]()
    var hospitalCourse = [Points]()
    var otherRelevantInfo = [Points]()
    var conditionAtDischarge = [Points]()
    
    //Final Management Plan
    var treatmentView = [Points]()
    var finalTime: String?
    var finalDate: String?
    var finalSignatureView = [Points]()
    var finalNameView = [Points]()
    
    
    //Follow Up OPD
    
    var followUpMon: Bool?
    var followUpWed: Bool?
    var followUpFri: Bool?
    
    init(data: PatientDetails) {
        self.name = data.name
        self.age = data.age
        self.gender = data.gender
        self.referredFrom = data.referredFrom
        self.informantName = data.informantName
        self.placeOfInjury = data.placeOfInjury
        self.timeOfExamination = data.timeOfExamination
        self.timeOfInjury = data.timeOfInjury
        self.dateOfExamination = data.dateOfExamination
        self.dateOfInjury = data.dateOfInjury
        self.isHearsay = checkBool(data.isHearsay)
        self.wasEyewithnessPresent = checkBool(data.isEyewitness)
    
        self.ns1Monday = checkBool(data.nsMon)
        self.ns2Wednesday = checkBool(data.nsWed)
        self.ns3Friday = checkBool(data.nsFri)
        self.isRTA = checkBool(data.isRTA)
        self.isFall = checkBool(data.isFall)
        self.isOther = checkBool(data.isOther)
        self.isAssault = checkBool(data.isAssault)
        self.isDriver = checkBool(data.isDriver)
        self.isPedestrian = checkBool(data.isPedestrian)
        self.isPassenger = checkBool(data.isPassenger)
        self.helmet = data.helmet
        self.alcohol = data.alcohol
        
        //History following trauma
        
        self.didLoseConsciousness = checkBool(data.didLoseConsciousness)
        self.didHaveLucidInterval = checkBool(data.didLucidDream)
        self.didHaveSeizures = checkBool(data.siezures)
        self.didVomit = checkBool(data.vomiting)
        self.hasAmnesia = checkBool(data.amnesia)
        self.isBleedingFromEar = checkBool(data.bleedingFromEar)
        self.isBleedingFromNose = checkBool(data.bleedingFromNose)
        
        
        //Vital signs on arrival
        
        self.airway = data.airway
        self.respiration = data.respiration
        self.carotidPulsations = data.carotidPulsations
        self.pulseRatePerMin = data.pulseRatePerMin
        self.bpOnArrival = data.bpOnArrival
        self.bpAfterHalfHour = data.bpAfterHalfHour
        
        
        //Details of systematic examination
        
        
        self.csfRhin = checkBool(data.csf)
        self.otorrhoea = checkBool(data.otorrhoea)
        self.activePeripheralBleeding = checkBool(data.activePeripheralBleeding)
        self.fractures = checkBool(data.fractures)
        self.peripheralPulses = checkBool(data.peripheralPulses)
        self.chestInjury = checkBool(data.chestInjury)
        self.abdominalInjury = checkBool(data.abdominalInjury)
        self.wounds = checkBool(data.wounds)
        
        
        //Details of spine examination
        self.spineTenderness = checkBool(data.spineTenderness)
        self.spineDeformity = checkBool(data.spineDeformity)
        
        
        //Neurological Examination
        
        self.eoScoreInitial = data.eoScoreInitial
        self.eoScoreAfter = data.eoScoreAfter
        self.mrScoreInitial = data.mrScoreInitial
        self.mrScoreAfter = data.mrScoreAfter
        self.vrScoreInitial = data.vrScoreInitial
        self.vrScoreAfter = data.vrScoreAfter
        
        self.totalInitial = data.totalInitial
        self.totalAfter = data.totalAfter
        
        self.horRight = data.horRight
        
        self.horLeft = data.horLeft
        
        self.plrRightmm = data.plrRightmm
        self.plrRight = data.plrRight
        
        
        self.plrLeftmm = data.plrLeftmm
        self.plrLeft = data.plrLeft
        
        self.mseUpperRightTone = data.mseUpperRightTone
        self.mseUpperLeftTone = data.mseUpperLeftTone
        self.mseUpperRightPower = data.mseUpperRightPower
        self.mseUpperLeftPower = data.mseUpperLeftPower
        
        
        self.mseLowerRightTone = data.mseLowerRightTone
        self.mseLowerLeftTone = data.mseLowerLeftTone
        self.mseLowerRightPower = data.mseLowerRightPower
        self.mseLowerLeftPower = data.mseLowerLeftPower
        
        //Clinical Impressions
        self.changesInGCS = data.changesInGCS
        self.ctScanHours = data.ctScanHour
        
        //Draw Views
        
        if let allCTScanPoints = data.ctScanPoints?.allObjects as? [LinePoints] {
            for ctScanPoint in allCTScanPoints {
                let val = Points(data: ctScanPoint)
                ctScanPoints.append(val)
            }
        }
        if let allotherNeurologicalDeficits = data.neurologicalDefectsPoints?.allObjects as? [LinePoints] {
            for otherNeurologicalDeficitsPoints in allotherNeurologicalDeficits {
                let val = Points(data: otherNeurologicalDeficitsPoints)
                otherNeurologicalDeficits.append(val)
            }
            
        }
        if let allPoints = data.managementPlan?.allObjects as? [LinePoints] {
            for point in allPoints {
                let val = Points(data: point)
                managementPlanPoints.append(val)
            }
            
        }
        if let allPoints = data.signature?.allObjects as? [LinePoints] {
            for point in allPoints {
                let val = Points(data: point)
                signature.append(val)
            }
            
        }
        if let allPoints = data.residentName?.allObjects as? [LinePoints] {
            for point in allPoints {
                let val = Points(data: point)
                residentName.append(val)
            }
            
        }
        if let allPoints = data.hospitalCourse?.allObjects as? [LinePoints] {
            for point in allPoints {
                let val = Points(data: point)
                hospitalCourse.append(val)
            }
            
        }
        if let allPoints = data.otherRelevantInfo?.allObjects as? [LinePoints] {
            for point in allPoints {
                let val = Points(data: point)
                otherRelevantInfo.append(val)
            }
            
        }
        if let allPoints = data.conditionAtDischarge?.allObjects as? [LinePoints] {
            for point in allPoints {
                let val = Points(data: point)
                conditionAtDischarge.append(val)
            }
            
        }
        
        //Final Management Plan
        if let allPoints = data.treatmentPoints?.allObjects as? [LinePoints] {
            for point in allPoints {
                let val = Points(data: point)
                treatmentView.append(val)
            }
            
        }
        self.finalTime = data.finalTime
        self.finalDate = data.finalDate
        
        if let allPoints = data.finalSignature?.allObjects as? [LinePoints] {
            for point in allPoints {
                let val = Points(data: point)
                finalSignatureView.append(val)
            }
            
        }
        
        if let allPoints = data.finalName?.allObjects as? [LinePoints] {
            for point in allPoints {
                let val = Points(data: point)
                finalNameView.append(val)
            }
            
        }
        
        
        //Follow Up OPD
        
        self.followUpMon = checkBool(data.followUpMon)
        self.followUpWed = checkBool(data.followUpWed)
        self.followUpFri = checkBool(data.followUpFri)

    }
    
    private func checkBool(value: NSNumber?) -> Bool {
        if let val = value {
            if val.isEqualToValue(NSNumber(bool: true)) {
                return true
            }
            else {
                return false
            }
        }
        
        return false
    }
}