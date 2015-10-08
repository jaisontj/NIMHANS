//
//  UserInformation.swift
//  NIMHANS
//
//  Created by Jaison Titus on 07/10/15.
//  Copyright © 2015 foofys. All rights reserved.
//

import Foundation

class UserInformation {
    let userName: String?
    let password: String?
    var patientDetails = [PatientInformation]()
    
    init(data: UserDetails) {
        self.userName = data.valueForKey("userName") as? String
        self.password = data.valueForKey("userPassword") as? String
        if let allPatientInfo = data.patientInformation?.allObjects as? [PatientDetails] {
            for patientInfo in allPatientInfo {
                let data = PatientInformation(data: patientInfo)
                patientDetails.append(data)
            }
            
        }
        
    }
}
