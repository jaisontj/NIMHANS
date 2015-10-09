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
    
        self.isRTA = checkBool(data.isRTA)
        self.isFall = checkBool(data.isFall)
        self.isOther = checkBool(data.isOther)
        self.isAssault = checkBool(data.isAssault)
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