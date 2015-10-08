//
//  PatientInformation.swift
//  NIMHANS
//
//  Created by Jaison Titus on 07/10/15.
//  Copyright © 2015 foofys. All rights reserved.
//

import Foundation

class PatientInformation {
    let name: String?
    
    init(data: PatientDetails) {
        self.name = data.name
    }
}