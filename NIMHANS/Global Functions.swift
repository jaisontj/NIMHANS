//
//  Global Functions.swift
//  NIMHANS
//
//  Created by Jaison Titus on 10/10/15.
//  Copyright © 2015 foofys. All rights reserved.
//

import Foundation
import CoreData
import UIKit

var currentUser: UserInformation?
var selectedPatient: PatientInformation?
var didAddNewPatient = false
var shouldDisplayPatientInfo = false


func fetchDataForUserName(name: String,callback: (Bool) -> Void) {
    var userFound = false
    let appDelegate =
    UIApplication.sharedApplication().delegate as! AppDelegate
    let managedContext = appDelegate.managedObjectContext
    let fetchRequest = NSFetchRequest(entityName:"UserDetails")
    
    do {
        let fetchedResults = try managedContext.executeFetchRequest(fetchRequest) as? [UserDetails]
        if let users = fetchedResults {
            for user in users {
                let data = UserInformation(data: user)
                if name == data.userName {
                    currentUser = data
                    print("count:"+(currentUser?.patientDetails.count)!)
                    userFound = true
                    callback(true)
                    break
                }
            }
        }
        else {
        }
        
    }
    catch {
    }
    if !userFound {
        callback(false)
    }
}

 func invokeAlertMethod(msgtitle: String, msgBody: String, delegate: AnyObject?) {
    let alert: UIAlertView = UIAlertView()
    alert.title = msgtitle
    alert.message = msgBody
    alert.delegate = delegate
    alert.addButtonWithTitle("Ok")
    alert.show()
}


