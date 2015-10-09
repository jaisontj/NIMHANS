//
//  PatientInformationViewController.swift
//  NIMHANS
//
//  Created by Jaison Titus on 09/10/15.
//  Copyright © 2015 foofys. All rights reserved.
//

import UIKit
import Foundation
import CoreData

class PatientInformationViewController: UITableViewController, DrawViewDelegate,UITextFieldDelegate {

    @IBOutlet weak var navBarTitle: UINavigationItem!
    
    //Patient details
    
    @IBOutlet weak var patientName: UITextField!
    @IBOutlet weak var patientAge: UITextField!
    @IBOutlet weak var patientReferredFrom: UITextField!
    @IBOutlet weak var placeOfInjury: UITextField!
    

    @IBOutlet weak var isPatientMale: UIButton!
    @IBOutlet weak var isPatientFemale: UIButton!
    @IBOutlet weak var isPatientOther: UIButton!
    
    @IBOutlet weak var wasEyewithnessPresent: UIButton!
    @IBOutlet weak var isHearsay: UIButton!
    
    
    //History of injury in detail
    
    
    @IBOutlet weak var isRTA: UIButton!
    @IBOutlet weak var isFall: UIButton!
    @IBOutlet weak var isAssault: UIButton!
    @IBOutlet weak var isOther: UIButton!
    
    @IBOutlet weak var isDriver: UIButton!
    @IBOutlet weak var isPedestrian: UIButton!
    @IBOutlet weak var isPassenger: UIButton!
    @IBOutlet weak var helmetYes: UIButton!
    @IBOutlet weak var helmetNo: UIButton!
    @IBOutlet weak var alcoholYes: UIButton!
    @IBOutlet weak var alcoholNo: UIButton!
    
    //History following trauma
    
    @IBOutlet weak var didLoseConsciousness: UIButton!
    @IBOutlet weak var didHaveLucidInterval: UIButton!
    @IBOutlet weak var didHaveSeizures: UIButton!
    @IBOutlet weak var didVomit: UIButton!
    @IBOutlet weak var hasAmnesia: UIButton!
    @IBOutlet weak var isBleedingFromEar: UIButton!
    @IBOutlet weak var isBleedingFromNose: UIButton!
    
    
    //Vital signs on arrival
    
    @IBOutlet weak var airwayClear: UIButton!
    @IBOutlet weak var airwayRequiresIntubation: UIButton!
    @IBOutlet weak var respirationNormal: UIButton!
    @IBOutlet weak var respirationTachypnoeic: UIButton!
    @IBOutlet weak var respirationGasping: UIButton!
    @IBOutlet weak var carotidPulsationsLeft: UIButton!
    @IBOutlet weak var carotidPulsationsRight: UIButton!
    @IBOutlet weak var pulseRatePerMin: UITextField!
    @IBOutlet weak var bpOnArrival: UITextField!
    @IBOutlet weak var bpAfterHalfHour: UITextField!
    
    
    //Details of systematic examination
    
    
    @IBOutlet weak var csfRhin: UIButton!
    @IBOutlet weak var otorrhoea: UIButton!
    @IBOutlet weak var activePeripheralBleeding: UIButton!
    @IBOutlet weak var fractures: UIButton!
    @IBOutlet weak var peripheralPulses: UIButton!
    @IBOutlet weak var chestInjury: UIButton!
    @IBOutlet weak var abdominalInjury: UIButton!
    @IBOutlet weak var wounds: UIButton!
    
    
    //Details of spine examination
    @IBOutlet weak var spineTenderness: UIButton!
    @IBOutlet weak var spineDeformity: UIButton!
    
    //Clinical Impressions
    @IBOutlet weak var changesInGCSYes: UIButton!
    @IBOutlet weak var changesInGCSNo: UIButton!
    
    @IBOutlet weak var ctScanHours: UITextField!
    
    
    //Draw Views
    
    @IBOutlet weak var ctScanDrawView: DrawView!
    @IBOutlet weak var managementPlanView: DrawView!
    @IBOutlet weak var signature: DrawView!
    @IBOutlet weak var residentNameView: DrawView!
    @IBOutlet weak var hospitalCourseView: DrawView!
    @IBOutlet weak var otherRelevantInfoView: DrawView!
    
  
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpButtons()
        setDelegates()
    }
    
    func setDelegates() {
        ctScanDrawView.delegate = self
        managementPlanView.delegate = self
        signature.delegate = self
        residentNameView.delegate = self
        otherRelevantInfoView.delegate = self
    }
    
    func setUpButtons() {
        
        setButton(isPatientMale)
        setButton(isPatientFemale)
        setButton(isPatientOther)
        setButton(wasEyewithnessPresent)
        setButton(isHearsay)
        
        
        setButton(isRTA)
        setButton(isFall)
        setButton(isAssault)
        setButton(isOther)
        setButton(isDriver)
        setButton(isPassenger)
        setButton(isPedestrian)
        setButton(helmetNo)
        setButton(helmetYes)
        setButton(alcoholNo)
        setButton(alcoholYes)
        
        setButton(didLoseConsciousness)
        setButton(didHaveLucidInterval)
        setButton(didHaveSeizures)
        setButton(didVomit)
        setButton(hasAmnesia)
        setButton(isBleedingFromEar)
        setButton(isBleedingFromNose)
        
        setButton(airwayClear)
        setButton(airwayRequiresIntubation)
        setButton(respirationNormal)
        setButton(respirationTachypnoeic)
        setButton(respirationGasping)
        setButton(carotidPulsationsLeft)
        setButton(carotidPulsationsRight)
        
        
        //Details of systematic examination
        
        
        setButton(csfRhin)
        setButton(otorrhoea)
        setButton(activePeripheralBleeding)
        setButton(fractures)
        setButton(peripheralPulses)
        setButton(chestInjury)
        setButton(abdominalInjury)
        setButton(wounds)
        
        
        //Details of spine examination
        setButton(spineTenderness)
        setButton(spineDeformity)
    }
    
    
    func onButtonClick(sender: UIButton) {
        sender.selected = !sender.selected
    }

    private func setButton(sender: UIButton) {
        sender.addTarget(self, action: "onButtonClick:", forControlEvents: .TouchUpInside)
        sender.setImage(UIImage(named: "checked_checkbox"), forState: UIControlState.Selected);
        sender.setImage(UIImage(named: "unchecked_checkbox"), forState: UIControlState.Normal);
    }
    
    @IBAction func dateOfExamination(sender: UIDatePicker) {
        
    }
    @IBAction func dateOfInjury(sender: UIDatePicker) {
        
    }
    
    func save() {
        deleteSavedData()
        addUserToDB()
    }
    
    func deleteSavedData() {
        let appDelegate =
        UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        let fetchRequest = NSFetchRequest(entityName: "UserDetails")
        
        let fetchedResults: [NSManagedObject]?
        do {
            fetchedResults = try managedContext.executeFetchRequest(fetchRequest) as? [NSManagedObject]
            if let results = fetchedResults {
                for user in results {
                    if let userTemp = user as? UserDetails {
                        if userTemp.userName == currentUser?.userName {
                            managedContext.deleteObject(user)
                        }
                    }
                }
            }
        }
        catch {
            print("error: \(error)")
        }
    }
    
    private func addUserToDB() {
        let appDelegate =
        UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        
        let newUserEntry =
        NSEntityDescription.insertNewObjectForEntityForName("UserDetails", inManagedObjectContext: managedContext) as! UserDetails
        
        newUserEntry.userName = currentUser?.userName
        newUserEntry.userPassword = currentUser?.password
        if let patients = currentUser?.patientDetails {
            for patient in patients {
                let patientEntry =
                NSEntityDescription.insertNewObjectForEntityForName("PatientDetails", inManagedObjectContext: managedContext) as! PatientDetails
                
                patientEntry.name = patient.name
                patientEntry.age = patient.age
                patientEntry.referredFrom = patient.referredFrom
                patientEntry.placeOfInjury = patient.placeOfInjury
                patientEntry.gender = patient.gender
                patientEntry.isRTA = patient.isRTA
                
                newUserEntry.addPatients(patientEntry)
            }
        }
        
        let patientEntry =
        NSEntityDescription.insertNewObjectForEntityForName("PatientDetails", inManagedObjectContext: managedContext) as! PatientDetails
        
        patientEntry.name = patientName.text
        patientEntry.age = patientAge.text
        patientEntry.referredFrom = patientReferredFrom.text
        patientEntry.placeOfInjury = placeOfInjury.text
        
        if isPatientMale.selected {
            patientEntry.gender = "male"
        }
        if isPatientFemale.selected {
            patientEntry.gender = "female"
        }
        if isPatientOther.selected {
            patientEntry.gender = "other"
        }
        
        if isRTA.selected {
            patientEntry.isRTA = true
        }
        if isAssault.selected {
            patientEntry.isAssault = true
        }
        if isFall.selected {
            patientEntry.isFall = true
        }
        if isOther.selected {
            patientEntry.isOther = true
        }
        
        newUserEntry.addPatients(patientEntry)
        
        do {
            try managedContext.save()
        }
        catch {
            let nserror = error as NSError
            NSLog("Unresolved error \(nserror), \(nserror.userInfo)")
        }
        
    }
    
    @IBAction func doneButtonClicked(sender: UIBarButtonItem) {
        save()
    }
    
    //MARK: Drawview delegate methods
    
    func startedDrawing() {
        self.tableView.scrollEnabled = false
    }
    
    func stoppedDrawing() {
        self.tableView.scrollEnabled = true
    }
    
    //TableView method
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    
    //MARK: UITextFieldDelegate
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
    
}
