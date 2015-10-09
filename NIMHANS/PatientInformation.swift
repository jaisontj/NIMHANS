//
//  PatientInformation.swift
//  NIMHANS
//
//  Created by Jaison Titus on 07/10/15.
//  Copyright © 2015 foofys. All rights reserved.
//

import Foundation

class PatientInformation {
    var name: String?
    var age: String?
    var gender: String?
    var referredFrom: String?
    var informantName: String?
    var placeOfInjury: String?
    var isRTA: Bool?
    var isFall: Bool?
    var isOther: Bool?
    var isAssault: Bool?
    var doctorDetails: UserDetails?
    
    init(data: PatientDetails) {
        self.name = data.name
        self.age = data.age
        self.gender = data.gender
        self.referredFrom = data.referredFrom
        self.informantName = data.informantName
        self.placeOfInjury = data.placeOfInjury
        
        if data.isRTA!.isEqualToValue(NSNumber(bool: true)) {
            self.isRTA = true
        }
        else {
            self.isRTA = false
        }
        
        if data.isOther!.isEqualToValue(NSNumber(bool: true)) {
            self.isOther = true
        }
        else {
            self.isOther = false
        }
        
        if data.isAssault!.isEqualToValue(NSNumber(bool: true)) {
            self.isAssault = true
        }
        else {
            self.isAssault = false
        }
        
        if data.isFall!.isEqualToValue(NSNumber(bool: true)) {
            self.isFall = true
        }
        else {
            self.isFall = false
        }
    }
}