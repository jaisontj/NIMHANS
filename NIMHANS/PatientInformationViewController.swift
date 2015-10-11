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

class PatientInformationViewController: UITableViewController,UITextFieldDelegate {
    
    var numberOfClicks = 0
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    //Patient details
    
    @IBOutlet weak var patientName: UITextField!
    @IBOutlet weak var patientAge: UITextField!
    @IBOutlet weak var patientReferredFrom: UITextField!
    @IBOutlet weak var placeOfInjury: UITextField!
    @IBOutlet weak var informantsName: UITextField!
    @IBOutlet weak var isPatientMale: UIButton!
    @IBOutlet weak var isPatientFemale: UIButton!
    @IBOutlet weak var isPatientOther: UIButton!
    @IBOutlet weak var wasEyewithnessPresent: UIButton!
    @IBOutlet weak var isHearsay: UIButton!
    
    
    @IBOutlet weak var timeOfInjury: UITextField!
    @IBOutlet weak var timeOfExamination: UITextField!
    @IBOutlet weak var dateOfInjury: UITextField!
    @IBOutlet weak var dateOfExamination: UITextField!
    //OPD
    
    @IBOutlet weak var ns1Monday: UIButton!
    @IBOutlet weak var ns2Wednesday: UIButton!
    @IBOutlet weak var ns3Friday: UIButton!
    
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
    
    //Neurological Examination
    
    @IBOutlet weak var eoScoreInitial: UITextField!
    @IBOutlet weak var eoScoreAfter: UITextField!
    
    @IBOutlet weak var mrScoreInitial: UITextField!
    @IBOutlet weak var mrScoreAfter: UITextField!
    
    
    @IBOutlet weak var vrScoreInitial: UITextField!
    @IBOutlet weak var vrScoreAfter: UITextField!
    
    @IBOutlet weak var totalInitial: UITextField!
    @IBOutlet weak var totalAfter: UITextField!
    
    @IBOutlet weak var horRightPresent: UIButton!
    @IBOutlet weak var horRightAbsent: UIButton!
    @IBOutlet weak var horRightNotTested: UIButton!
    
    @IBOutlet weak var horLeftPresent: UIButton!
    @IBOutlet weak var horLeftAbsent: UIButton!
    @IBOutlet weak var horLeftNotTested: UIButton!
    
    @IBOutlet weak var plrRightmm: UITextField!
    @IBOutlet weak var plrRightNormal: UIButton!
    @IBOutlet weak var plrRightSluggish: UIButton!
    @IBOutlet weak var plrRightAbsent: UIButton!
    @IBOutlet weak var plrRightCannotAsses: UIButton!
    
    
    @IBOutlet weak var plrLeftmm: UITextField!
    @IBOutlet weak var plrLeftNormal: UIButton!
    @IBOutlet weak var plrLeftSluggish: UIButton!
    @IBOutlet weak var plrLeftAbsent: UIButton!
    @IBOutlet weak var plrLeftCannotAssess: UIButton!
    
    @IBOutlet weak var mseUpperRightTone: UITextField!
    @IBOutlet weak var mseUpperLeftTone: UITextField!
    @IBOutlet weak var mseUpperRightPower: UITextField!
    @IBOutlet weak var mseUpperLeftPower: UITextField!
    
    
    @IBOutlet weak var mseLowerRightTone: UITextField!
    @IBOutlet weak var mseLowerLeftTone: UITextField!
    @IBOutlet weak var mseLowerRightPower: UITextField!
    @IBOutlet weak var mseLowerLeftPower: UITextField!
    
    //Clinical Impressions
    @IBOutlet weak var changesInGCSYes: UIButton!
    @IBOutlet weak var changesInGCSNo: UIButton!
    @IBOutlet weak var ctScanHours: UITextField!
    @IBOutlet weak var ctScanDrawView: DrawView!
    
    
    @IBOutlet weak var writeCTScan: UIButton!
    @IBOutlet weak var writeNeurologicalDefects: UIButton!
    @IBOutlet weak var writeOtherRelevantInfo: UIButton!
    @IBOutlet weak var writeManagementPlan: UIButton!
    @IBOutlet weak var writeSignature: UIButton!
    @IBOutlet weak var writeNameOfResident: UIButton!
    @IBOutlet weak var writeCourse: UIButton!
    @IBOutlet weak var conditionAtDIscharge: UIButton!
    @IBOutlet weak var finalManagementPlan: UIButton!
    @IBOutlet weak var finalSignature: UIButton!
    @IBOutlet weak var finalName: UIButton!
    
    //Draw Views

    @IBOutlet weak var otherNeurologicalDeficits: DrawView!
    @IBOutlet weak var managementPlanView: DrawView!
    @IBOutlet weak var signature: DrawView!
    @IBOutlet weak var residentNameView: DrawView!
    @IBOutlet weak var hospitalCourseView: DrawView!
    @IBOutlet weak var otherRelevantInfoView: DrawView!
    
    @IBOutlet weak var conditionAtDischarge: DrawView!
    
    //Final Management Plan
    @IBOutlet weak var treatmentView: DrawView!
    @IBOutlet weak var finalTime: UITextField!
    @IBOutlet weak var finalDate: UITextField!
    @IBOutlet weak var finalSignatureView: DrawView!
    @IBOutlet weak var finalNameView: DrawView!
    
    
    //Follow Up OPD
    
    @IBOutlet weak var followUpMon: UIButton!
    @IBOutlet weak var followUpWed: UIButton!
    @IBOutlet weak var followUpFri: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpButtons()
        setUpPickers()
                
        if shouldDisplayPatientInfo {
            displayPatientInformation()
        }
    }
    
    func setUpPickers() {
        setDateTextField(dateOfExamination)
        setDateTextField(dateOfInjury)
        setDateTextField(finalDate)
        
        setTimeTextField(timeOfExamination)
        setTimeTextField(timeOfInjury)
        setTimeTextField(finalTime)
    }
    
    private func setDateTextField(sender: UITextField) {
        sender.addTarget(self, action: "onDateTextFieldSelected:", forControlEvents: UIControlEvents.EditingDidBegin)
    }
    
    private func setTimeTextField(sender: UITextField) {
        sender.addTarget(self, action: "onTimeTextFieldSelected:", forControlEvents: UIControlEvents.EditingDidBegin)
    }
    
    func onDateTextFieldSelected(sender: UITextField) {
        let datePickerView:UIDatePicker = UIDatePicker()
        datePickerView.datePickerMode = UIDatePickerMode.Date
        sender.inputView = datePickerView
        datePickerView.addTarget(self, action: "datePickerValueChanged:", forControlEvents: UIControlEvents.ValueChanged)
        setDate(sender, picker: datePickerView)
        addCloseButtonToPicker(sender)
    }
    
    func onTimeTextFieldSelected(sender: UITextField) {
        let datePickerView:UIDatePicker = UIDatePicker()
        datePickerView.datePickerMode = UIDatePickerMode.Time
        sender.inputView = datePickerView
        datePickerView.addTarget(self, action: "timePickerValueChanged:", forControlEvents: UIControlEvents.ValueChanged)
        setTime(sender, picker: datePickerView)
        addCloseButtonToPicker(sender)
    }
    
    func addCloseButtonToPicker(sender: UITextField) {
        let toolBar = UIToolbar(frame: CGRectMake(0, 0, 0, 40))
        toolBar.barStyle = UIBarStyle.Default
        toolBar.tintColor = UIColor.blackColor()
        toolBar.backgroundColor = UIColor.greenColor()
        let toolBarButton = UIBarButtonItem(title: "Close picker", style: UIBarButtonItemStyle.Done, target: self, action: "closeButtonPressed:")
        toolBar.items = [toolBarButton]
        sender.inputAccessoryView = toolBar
    }
    
    func closeButtonPressed(sender: UIBarButtonItem) {
        self.view.endEditing(true)
    }
    
    func datePickerValueChanged(sender:UIDatePicker) {
        if finalDate.isFirstResponder() {
            setDate(finalDate, picker: sender)
        }
        if dateOfInjury.isFirstResponder() {
            setDate(dateOfInjury, picker: sender)
        }
        if dateOfExamination.isFirstResponder(){
            setDate(dateOfExamination, picker: sender)
        }
    }
    
    func timePickerValueChanged(sender:UIDatePicker) {
        if finalTime.isFirstResponder() {
            setTime(finalTime, picker: sender)
        }
        if timeOfInjury.isFirstResponder() {
            setTime(timeOfInjury, picker: sender)
        }
        if timeOfExamination.isFirstResponder(){
            setTime(timeOfExamination, picker: sender)
        }
    }
    
    func setDate(sender: UITextField,picker: UIDatePicker) {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = NSDateFormatterStyle.MediumStyle
        dateFormatter.timeStyle = NSDateFormatterStyle.NoStyle
        
        sender.text = dateFormatter.stringFromDate(picker.date)
    }
    
    func setTime(sender: UITextField,picker: UIDatePicker) {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = NSDateFormatterStyle.NoStyle
        dateFormatter.timeStyle = NSDateFormatterStyle.MediumStyle
        
        sender.text = dateFormatter.stringFromDate(picker.date)
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
        
        //OPD
        
        setButton(ns1Monday)
        setButton(ns2Wednesday)
        setButton(ns3Friday)
        
        setButton(horRightPresent)
        setButton(horRightAbsent)
        setButton(horRightNotTested)
        
        setButton(horLeftPresent)
        setButton(horLeftAbsent)
        setButton(horLeftNotTested)
        
        setButton(plrRightNormal)
        setButton(plrRightSluggish)
        setButton(plrRightAbsent)
        setButton(plrRightCannotAsses)
        
        
        setButton(plrLeftNormal)
        setButton(plrLeftSluggish)
        setButton(plrLeftAbsent)
        setButton(plrLeftCannotAssess)
        
        //Clinical Impressions
        setButton(changesInGCSYes)
        setButton(changesInGCSNo)
        
        //Follow Up OPD
        
        setButton(followUpMon)
        setButton(followUpWed)
        setButton(followUpFri)
        
        //Button for the drawViews
        setViewButton(writeCTScan)
        setViewButton(writeNeurologicalDefects)
        setViewButton(writeOtherRelevantInfo)
        setViewButton(writeManagementPlan)
        setViewButton(writeSignature)
        setViewButton(writeNameOfResident)
        setViewButton(writeCourse)
        setViewButton(conditionAtDIscharge)
        setViewButton(finalManagementPlan)
        setViewButton(finalSignature)
        setViewButton(finalName)

        
    }
    
    private func setViewButton(sender: UIButton) {
        sender.addTarget(self, action: "onWriteButtonClick:", forControlEvents: .TouchUpInside)
        sender.setImage(UIImage(named: "tick"), forState: UIControlState.Selected);
        sender.setImage(UIImage(named: "edit"), forState: UIControlState.Normal);
    }
    
    func onWriteButtonClick(sender: UIButton) {
        sender.selected = !sender.selected
        if sender.selected {
            numberOfClicks++
        }
        else {
            numberOfClicks--
        }
        
        if numberOfClicks == 0 {
            self.tableView.scrollEnabled = true
        }
        else {
            self.tableView.scrollEnabled = false
        }
    }
    
    func onButtonClick(sender: UIButton) {
        sender.selected = !sender.selected
    }

    private func setButton(sender: UIButton) {
        sender.addTarget(self, action: "onButtonClick:", forControlEvents: .TouchUpInside)
        sender.setImage(UIImage(named: "checked_checkbox"), forState: UIControlState.Selected);
        sender.setImage(UIImage(named: "unchecked_checkbox"), forState: UIControlState.Normal);
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
                
                //Patient details
                patientEntry.name = patient.name
                patientEntry.age = patient.age
                patientEntry.referredFrom = patient.referredFrom
                patientEntry.informantName = patient.informantName
                patientEntry.placeOfInjury = patient.placeOfInjury
                patientEntry.gender = patient.gender
                
                patientEntry.isEyewitness = patient.wasEyewithnessPresent
                patientEntry.isHearsay = patient.isHearsay
                patientEntry.timeOfInjury = patient.timeOfInjury
                patientEntry.timeOfExamination = patient.timeOfExamination
                patientEntry.dateOfInjury = patient.dateOfInjury
                patientEntry.dateOfExamination = patient.dateOfExamination
                
                //OPD
                
                patientEntry.nsMon = patient.ns1Monday
                patientEntry.nsWed = patient.ns2Wednesday
                patientEntry.nsFri = patient.ns3Friday
                
                //History of injury in detail
                
                
                patientEntry.isRTA = patient.isRTA
                patientEntry.isFall = patient.isFall
                patientEntry.isOther = patient.isOther
                patientEntry.isAssault = patient.isAssault
                
                patientEntry.isDriver = patient.isDriver
                patientEntry.isPedestrian = patient.isPedestrian
                patientEntry.isPassenger = patient.isPassenger
                patientEntry.helmet = patient.helmet
                patientEntry.alcohol = patient.alcohol
                
                //History following trauma
                
                patientEntry.didLoseConsciousness = patient.didLoseConsciousness
                patientEntry.didLucidDream = patient.didHaveLucidInterval
                patientEntry.siezures = patient.didHaveSeizures
                patientEntry.vomiting = patient.didVomit
                patientEntry.amnesia = patient.hasAmnesia
                patientEntry.bleedingFromEar = patient.isBleedingFromEar
                patientEntry.bleedingFromNose = patient.isBleedingFromNose
                
                
                //Vital signs on arrival
                
                patientEntry.airway = patient.airway
                patientEntry.respiration = patient.respiration
                patientEntry.carotidPulsations = patient.carotidPulsations
                patientEntry.pulseRatePerMin = patient.pulseRatePerMin
                patientEntry.bpOnArrival = patient.bpOnArrival
                patientEntry.bpAfterHalfHour = patient.bpAfterHalfHour
                
                
                //Details of systematic examination
                
                
                patientEntry.csf = patient.csfRhin
                patientEntry.otorrhoea = patient.otorrhoea
                patientEntry.activePeripheralBleeding = patient.activePeripheralBleeding
                patientEntry.fractures = patient.fractures
                patientEntry.peripheralPulses = patient.peripheralPulses
                patientEntry.chestInjury = patient.chestInjury
                patientEntry.abdominalInjury = patient.abdominalInjury
                patientEntry.wounds = patient.wounds
                
                
                //Details of spine examination
                patientEntry.spineTenderness = patient.spineTenderness
                patientEntry.spineDeformity = patient.spineDeformity
                
                //Neurological Examination
                
                patientEntry.eoScoreInitial = patient.eoScoreInitial
                patientEntry.eoScoreAfter = patient.eoScoreAfter
                
                patientEntry.mrScoreInitial = patient.mrScoreInitial
                patientEntry.mrScoreAfter = patient.mrScoreAfter
                
                
                patientEntry.vrScoreInitial = patient.vrScoreInitial
                patientEntry.vrScoreAfter = patient.vrScoreAfter
                
                patientEntry.totalInitial = patient.totalInitial
                patientEntry.totalAfter = patient.totalAfter
                
                patientEntry.horRight = patient.horRight
                
                patientEntry.horLeft = patient.horLeft
                
                patientEntry.plrRightmm = patient.plrRightmm
                patientEntry.plrRight = patient.plrRight
                
                
                patientEntry.plrLeftmm = patient.plrLeftmm
                patientEntry.plrLeft = patient.plrLeft
                
                patientEntry.mseUpperRightTone = patient.mseUpperRightTone
                patientEntry.mseUpperLeftTone = patient.mseUpperLeftTone
                patientEntry.mseUpperRightPower = patient.mseUpperRightPower
                patientEntry.mseUpperLeftPower = patient.mseUpperLeftPower
                
                
                patientEntry.mseLowerRightTone = patient.mseLowerRightTone
                patientEntry.mseLowerLeftTone = patient.mseLowerLeftTone
                patientEntry.mseLowerRightPower = patient.mseLowerRightPower
                patientEntry.mseLowerLeftPower = patient.mseLowerLeftPower
                
                //Clinical Impressions
                patientEntry.changesInGCS = patient.changesInGCS
                patientEntry.ctScanHour = patient.ctScanHours
            
                patientEntry.finalTime = patient.finalTime
                patientEntry.finalDate = patient.finalDate
                
                patientEntry.followUpMon = patient.followUpMon
                patientEntry.followUpWed = patient.followUpWed
                patientEntry.followUpFri = patient.followUpFri
     
                for ctScanPoint in patient.ctScanPoints {
                    let ctScanPointEntry =
                    NSEntityDescription.insertNewObjectForEntityForName("LinePoints", inManagedObjectContext: managedContext) as! LinePoints
                    
                    ctScanPointEntry.startX = ctScanPoint.startX
                    ctScanPointEntry.startY = ctScanPoint.startY
                    ctScanPointEntry.endX = ctScanPoint.endX
                    ctScanPointEntry.endY = ctScanPoint.endY
                    
                    patientEntry.addPoints(ctScanPointEntry,keyValue: "ctScanPoints")

                }
                
                for point in patient.signature {
                    let pointEntry =
                    NSEntityDescription.insertNewObjectForEntityForName("LinePoints", inManagedObjectContext: managedContext) as! LinePoints
                    
                    pointEntry.startX = point.startX
                    pointEntry.startY = point.startY
                    pointEntry.endX = point.endX
                    pointEntry.endY = point.endY
                    
                    patientEntry.addPoints(pointEntry,keyValue: "signature")
                    
                }
                
                for point in patient.residentName {
                    let pointEntry =
                    NSEntityDescription.insertNewObjectForEntityForName("LinePoints", inManagedObjectContext: managedContext) as! LinePoints
                    
                    pointEntry.startX = point.startX
                    pointEntry.startY = point.startY
                    pointEntry.endX = point.endX
                    pointEntry.endY = point.endY
                    
                    patientEntry.addPoints(pointEntry,keyValue: "residentName")
                    
                }
                
                for point in patient.hospitalCourse {
                    let pointEntry =
                    NSEntityDescription.insertNewObjectForEntityForName("LinePoints", inManagedObjectContext: managedContext) as! LinePoints
                    
                    pointEntry.startX = point.startX
                    pointEntry.startY = point.startY
                    pointEntry.endX = point.endX
                    pointEntry.endY = point.endY
                    
                    patientEntry.addPoints(pointEntry,keyValue: "hospitalCourse")
                    
                }
                
                for point in patient.otherRelevantInfo {
                    let pointEntry =
                    NSEntityDescription.insertNewObjectForEntityForName("LinePoints", inManagedObjectContext: managedContext) as! LinePoints
                    
                    pointEntry.startX = point.startX
                    pointEntry.startY = point.startY
                    pointEntry.endX = point.endX
                    pointEntry.endY = point.endY
                    
                    patientEntry.addPoints(pointEntry,keyValue: "otherRelevantInfo")
                    
                }
                
                for point in patient.conditionAtDischarge {
                    let pointEntry =
                    NSEntityDescription.insertNewObjectForEntityForName("LinePoints", inManagedObjectContext: managedContext) as! LinePoints
                    
                    pointEntry.startX = point.startX
                    pointEntry.startY = point.startY
                    pointEntry.endX = point.endX
                    pointEntry.endY = point.endY
                    
                    patientEntry.addPoints(pointEntry,keyValue: "conditionAtDischarge")
                    
                }
                
                for point in patient.treatmentView {
                    let pointEntry =
                    NSEntityDescription.insertNewObjectForEntityForName("LinePoints", inManagedObjectContext: managedContext) as! LinePoints
                    
                    pointEntry.startX = point.startX
                    pointEntry.startY = point.startY
                    pointEntry.endX = point.endX
                    pointEntry.endY = point.endY
                    
                    patientEntry.addPoints(pointEntry,keyValue: "treatmentPoints")
                    
                }
                
                for point in patient.finalSignatureView {
                    let pointEntry =
                    NSEntityDescription.insertNewObjectForEntityForName("LinePoints", inManagedObjectContext: managedContext) as! LinePoints
                    
                    pointEntry.startX = point.startX
                    pointEntry.startY = point.startY
                    pointEntry.endX = point.endX
                    pointEntry.endY = point.endY
                    
                    patientEntry.addPoints(pointEntry,keyValue: "finalSignature")
                    
                }
                
                for point in patient.finalNameView {
                    let pointEntry =
                    NSEntityDescription.insertNewObjectForEntityForName("LinePoints", inManagedObjectContext: managedContext) as! LinePoints
                    
                    pointEntry.startX = point.startX
                    pointEntry.startY = point.startY
                    pointEntry.endX = point.endX
                    pointEntry.endY = point.endY
                    
                    patientEntry.addPoints(pointEntry,keyValue: "finalName")
                    
                }
                
                for point in patient.otherNeurologicalDeficits {
                    let pointEntry =
                    NSEntityDescription.insertNewObjectForEntityForName("LinePoints", inManagedObjectContext: managedContext) as! LinePoints
                    
                    pointEntry.startX = point.startX
                    pointEntry.startY = point.startY
                    pointEntry.endX = point.endX
                    pointEntry.endY = point.endY
                    
                    patientEntry.addPoints(pointEntry,keyValue: "neurologicalDefectsPoints")
                    
                }
                
                for point in patient.managementPlanPoints {
                    let pointEntry =
                    NSEntityDescription.insertNewObjectForEntityForName("LinePoints", inManagedObjectContext: managedContext) as! LinePoints
                    
                    pointEntry.startX = point.startX
                    pointEntry.startY = point.startY
                    pointEntry.endX = point.endX
                    pointEntry.endY = point.endY
                    
                    patientEntry.addPoints(pointEntry,keyValue: "managementPlan")
                    
                }
                
                newUserEntry.addPatients(patientEntry)
            }
        }
        
        let patientEntry =
        NSEntityDescription.insertNewObjectForEntityForName("PatientDetails", inManagedObjectContext: managedContext) as! PatientDetails
        
        patientEntry.name = patientName.text
        patientEntry.age = patientAge.text
        patientEntry.referredFrom = patientReferredFrom.text
        patientEntry.placeOfInjury = placeOfInjury.text
        
        //Patient details
        patientEntry.informantName = informantsName.text
        patientEntry.placeOfInjury = placeOfInjury.text
        
        patientEntry.isEyewitness = wasEyewithnessPresent.selected
        patientEntry.isHearsay = isHearsay.selected
        patientEntry.timeOfInjury = timeOfInjury.text
        patientEntry.timeOfExamination = timeOfExamination.text
        patientEntry.dateOfInjury = dateOfInjury.text
        patientEntry.dateOfExamination = dateOfExamination.text
        
        //OPD
        
        patientEntry.nsMon = ns1Monday.selected
        patientEntry.nsWed = ns2Wednesday.selected
        patientEntry.nsFri = ns3Friday.selected
        
        //History of injury in detail
        
        
        patientEntry.isRTA = isRTA.selected
        patientEntry.isFall = isFall.selected
        patientEntry.isOther = isOther.selected
        patientEntry.isAssault = isAssault.selected
        
        patientEntry.isDriver = isDriver.selected
        patientEntry.isPedestrian = isPedestrian.selected
        patientEntry.isPassenger = isPassenger.selected
        
        if helmetYes.selected {
            patientEntry.helmet = "yes"
        }
        if helmetNo.selected {
            patientEntry.helmet = "no"
        }
        
        if alcoholYes.selected {
            patientEntry.alcohol = "yes"
        }
        if alcoholNo.selected {
            patientEntry.alcohol = "no"
        }
        
        //History following trauma
        
        patientEntry.didLoseConsciousness = didLoseConsciousness.selected
        patientEntry.didLucidDream = didHaveLucidInterval.selected
        patientEntry.siezures = didHaveSeizures.selected
        patientEntry.vomiting = didVomit.selected
        patientEntry.amnesia = hasAmnesia.selected
        patientEntry.bleedingFromEar = isBleedingFromEar.selected
        patientEntry.bleedingFromNose = isBleedingFromNose.selected
        
        
        //Vital signs on arrival
        
        if airwayClear.selected {
            patientEntry.airway = "clear"
        }
        if airwayRequiresIntubation.selected {
            patientEntry.airway = "notclear"
        }
        
        if respirationNormal.selected {
            patientEntry.respiration = "normal"
        }
        if respirationGasping.selected {
            patientEntry.respiration = "gasping"
        }
        if respirationTachypnoeic.selected {
            patientEntry.respiration = "tachy"
        }

        if carotidPulsationsLeft.selected {
            patientEntry.carotidPulsations = "left"
        }
        if carotidPulsationsRight.selected {
            patientEntry.carotidPulsations = "right"
        }
        
        patientEntry.pulseRatePerMin = pulseRatePerMin.text
        patientEntry.bpOnArrival = bpOnArrival.text
        patientEntry.bpAfterHalfHour = bpAfterHalfHour.text
        
        
        //Details of systematic examination
        
        
        patientEntry.csf = csfRhin.selected
        patientEntry.otorrhoea = otorrhoea.selected
        patientEntry.activePeripheralBleeding = activePeripheralBleeding.selected
        patientEntry.fractures = fractures.selected
        patientEntry.peripheralPulses = peripheralPulses.selected
        patientEntry.chestInjury = chestInjury.selected
        patientEntry.abdominalInjury = abdominalInjury.selected
        patientEntry.wounds = wounds.selected
        
        
        //Details of spine examination
        patientEntry.spineTenderness = spineTenderness.selected
        patientEntry.spineDeformity = spineDeformity.selected
        
        //Neurological Examination
        
        patientEntry.eoScoreInitial = eoScoreInitial.text
        patientEntry.eoScoreAfter = eoScoreAfter.text
        
        patientEntry.mrScoreInitial = mrScoreInitial.text
        patientEntry.mrScoreAfter = mrScoreAfter.text
        
        
        patientEntry.vrScoreInitial = vrScoreInitial.text
        patientEntry.vrScoreAfter = vrScoreAfter.text
        
        patientEntry.totalInitial = totalInitial.text
        patientEntry.totalAfter = totalAfter.text
        
        if horRightAbsent.selected {
           patientEntry.horRight = "absent"
        }
        if horRightNotTested.selected {
            patientEntry.horRight = "nottested"
        }
        if horRightPresent.selected {
            patientEntry.horRight = "present"
        }
        
        if horLeftAbsent.selected {
            patientEntry.horLeft = "absent"
        }
        if horLeftNotTested.selected {
            patientEntry.horLeft = "nottested"
        }
        if horLeftPresent.selected {
            patientEntry.horLeft = "present"
        }
        
        patientEntry.plrRightmm = plrRightmm.text
        
        if plrRightNormal.selected {
            patientEntry.plrRight = "normal"
        }
        if plrRightSluggish.selected {
            patientEntry.plrRight = "sluggish"
        }
        if plrRightAbsent.selected {
            patientEntry.plrRight = "absent"
        }
        if plrRightCannotAsses.selected {
            patientEntry.plrRight = "cannotassess"
        }
        
        patientEntry.plrLeftmm = plrLeftmm.text
        if plrLeftNormal.selected {
            patientEntry.plrLeft = "normal"
        }
        if plrLeftSluggish.selected {
            patientEntry.plrLeft = "sluggish"
        }
        if plrLeftAbsent.selected {
            patientEntry.plrLeft = "absent"
        }
        if plrLeftCannotAssess.selected {
            patientEntry.plrLeft = "cannotassess"
        }
        
        patientEntry.mseUpperRightTone = mseUpperRightTone.text
        patientEntry.mseUpperLeftTone = mseUpperLeftTone.text
        patientEntry.mseUpperRightPower = mseUpperRightPower.text
        patientEntry.mseUpperLeftPower = mseUpperLeftPower.text
        
        
        patientEntry.mseLowerRightTone = mseLowerRightTone.text
        patientEntry.mseLowerLeftTone = mseLowerLeftTone.text
        patientEntry.mseLowerRightPower = mseLowerRightPower.text
        patientEntry.mseLowerLeftPower = mseLowerLeftPower.text
        
        //Clinical Impressions
        
        if changesInGCSNo.selected {
            patientEntry.changesInGCS = "no"
        }
        if changesInGCSYes.selected {
            patientEntry.changesInGCS = "yes"
        }
        
        patientEntry.ctScanHour = ctScanHours.text
        
        patientEntry.finalTime = finalTime.text
        patientEntry.finalDate = finalDate.text
        
        patientEntry.followUpMon = followUpMon.selected
        patientEntry.followUpWed = followUpWed.selected
        patientEntry.followUpFri = followUpFri.selected
        
        if isPatientMale.selected {
            patientEntry.gender = "male"
        }
        if isPatientFemale.selected {
            patientEntry.gender = "female"
        }
        if isPatientOther.selected {
            patientEntry.gender = "other"
        }
        
        for point in ctScanDrawView.lines {
            let pointEntry =
            NSEntityDescription.insertNewObjectForEntityForName("LinePoints", inManagedObjectContext: managedContext) as! LinePoints
            
            pointEntry.startX = Float(point.start.x)
            pointEntry.startY = Float(point.start.y)
            pointEntry.endX = Float(point.end.x)
            pointEntry.endY = Float(point.end.y)
            
            patientEntry.addPoints(pointEntry,keyValue: "ctScanPoints")
        }
        
        for point in managementPlanView.lines {
            let pointEntry =
            NSEntityDescription.insertNewObjectForEntityForName("LinePoints", inManagedObjectContext: managedContext) as! LinePoints
            
            pointEntry.startX = Float(point.start.x)
            pointEntry.startY = Float(point.start.y)
            pointEntry.endX = Float(point.end.x)
            pointEntry.endY = Float(point.end.y)
            
            patientEntry.addPoints(pointEntry,keyValue: "managementPlan")
        }
        
        for point in signature.lines {
            let pointEntry =
            NSEntityDescription.insertNewObjectForEntityForName("LinePoints", inManagedObjectContext: managedContext) as! LinePoints
            
            pointEntry.startX = Float(point.start.x)
            pointEntry.startY = Float(point.start.y)
            pointEntry.endX = Float(point.end.x)
            pointEntry.endY = Float(point.end.y)
            
            patientEntry.addPoints(pointEntry,keyValue: "signature")
        }
        
        for point in residentNameView.lines {
            let pointEntry =
            NSEntityDescription.insertNewObjectForEntityForName("LinePoints", inManagedObjectContext: managedContext) as! LinePoints
            
            pointEntry.startX = Float(point.start.x)
            pointEntry.startY = Float(point.start.y)
            pointEntry.endX = Float(point.end.x)
            pointEntry.endY = Float(point.end.y)
            
            patientEntry.addPoints(pointEntry,keyValue: "residentName")
        }
        
        for point in hospitalCourseView.lines {
            let pointEntry =
            NSEntityDescription.insertNewObjectForEntityForName("LinePoints", inManagedObjectContext: managedContext) as! LinePoints
            
            pointEntry.startX = Float(point.start.x)
            pointEntry.startY = Float(point.start.y)
            pointEntry.endX = Float(point.end.x)
            pointEntry.endY = Float(point.end.y)
            
            patientEntry.addPoints(pointEntry,keyValue: "hospitalCourse")
        }
        
        for point in otherRelevantInfoView.lines {
            let pointEntry =
            NSEntityDescription.insertNewObjectForEntityForName("LinePoints", inManagedObjectContext: managedContext) as! LinePoints
            
            pointEntry.startX = Float(point.start.x)
            pointEntry.startY = Float(point.start.y)
            pointEntry.endX = Float(point.end.x)
            pointEntry.endY = Float(point.end.y)
            
            patientEntry.addPoints(pointEntry,keyValue: "otherRelevantInfo")
        }
        
        for point in conditionAtDischarge.lines {
            let pointEntry =
            NSEntityDescription.insertNewObjectForEntityForName("LinePoints", inManagedObjectContext: managedContext) as! LinePoints
            
            pointEntry.startX = Float(point.start.x)
            pointEntry.startY = Float(point.start.y)
            pointEntry.endX = Float(point.end.x)
            pointEntry.endY = Float(point.end.y)
            
            patientEntry.addPoints(pointEntry,keyValue: "conditionAtDischarge")
        }
        
        for point in treatmentView.lines {
            let pointEntry =
            NSEntityDescription.insertNewObjectForEntityForName("LinePoints", inManagedObjectContext: managedContext) as! LinePoints
            
            pointEntry.startX = Float(point.start.x)
            pointEntry.startY = Float(point.start.y)
            pointEntry.endX = Float(point.end.x)
            pointEntry.endY = Float(point.end.y)
            
            patientEntry.addPoints(pointEntry,keyValue: "treatmentPoints")
        }
        
        for point in finalSignatureView.lines {
            let pointEntry =
            NSEntityDescription.insertNewObjectForEntityForName("LinePoints", inManagedObjectContext: managedContext) as! LinePoints
            
            pointEntry.startX = Float(point.start.x)
            pointEntry.startY = Float(point.start.y)
            pointEntry.endX = Float(point.end.x)
            pointEntry.endY = Float(point.end.y)
            
            patientEntry.addPoints(pointEntry,keyValue: "finalSignature")
        }
        
        for point in finalNameView.lines {
            let pointEntry =
            NSEntityDescription.insertNewObjectForEntityForName("LinePoints", inManagedObjectContext: managedContext) as! LinePoints
            
            pointEntry.startX = Float(point.start.x)
            pointEntry.startY = Float(point.start.y)
            pointEntry.endX = Float(point.end.x)
            pointEntry.endY = Float(point.end.y)
            
            patientEntry.addPoints(pointEntry,keyValue: "finalName")
        }
        
        for point in otherNeurologicalDeficits.lines {
            let pointEntry =
            NSEntityDescription.insertNewObjectForEntityForName("LinePoints", inManagedObjectContext: managedContext) as! LinePoints
            
            pointEntry.startX = Float(point.start.x)
            pointEntry.startY = Float(point.start.y)
            pointEntry.endX = Float(point.end.x)
            pointEntry.endY = Float(point.end.y)
            
            patientEntry.addPoints(pointEntry,keyValue: "neurologicalDefectsPoints")
        }
        
        newUserEntry.addPatients(patientEntry)
        
        do {
            try managedContext.save()
            didAddNewPatient = true
        }
        catch {
            let nserror = error as NSError
            NSLog("Unresolved error \(nserror), \(nserror.userInfo)")
        }
        
    }
    
    func displayPatientInformation() {
        shouldDisplayPatientInfo = false
        saveButton.enabled = false
        saveButton.tintColor = UIColor.clearColor()
        
        patientName.text = selectedPatient?.name
        patientAge.text = selectedPatient?.age
        patientReferredFrom.text = selectedPatient?.referredFrom
        placeOfInjury.text = selectedPatient?.placeOfInjury
        
        if selectedPatient?.gender == "male" {
            isPatientMale.selected = true
        }
        if selectedPatient?.gender == "female" {
            isPatientFemale.selected = true
        }
        if selectedPatient?.gender == "other" {
            isPatientOther.selected = true
        }

  
        //Patient details
        
        informantsName.text = selectedPatient?.informantName
        wasEyewithnessPresent.selected = checkBool(selectedPatient?.wasEyewithnessPresent)
        isHearsay.selected = checkBool(selectedPatient?.isHearsay)
        
        
        timeOfInjury.text = selectedPatient?.timeOfInjury
        timeOfExamination.text = selectedPatient?.timeOfExamination
        dateOfInjury.text = selectedPatient?.dateOfInjury
        dateOfExamination.text = selectedPatient?.dateOfExamination
        //OPD
        
        ns1Monday.selected = checkBool(selectedPatient?.ns1Monday)
        ns2Wednesday.selected = checkBool(selectedPatient?.ns2Wednesday)
        ns3Friday.selected = checkBool(selectedPatient?.ns3Friday)
        
        //History of injury in detail
        
        
        isRTA.selected = checkBool(selectedPatient?.isRTA)
        isAssault.selected = checkBool(selectedPatient?.isAssault)
        isFall.selected = checkBool(selectedPatient?.isFall)
        isOther.selected = checkBool(selectedPatient?.isOther)
        
        isDriver.selected = checkBool(selectedPatient?.isDriver)
        isPedestrian.selected = checkBool(selectedPatient?.isPedestrian)
        isPassenger.selected = checkBool(selectedPatient?.isPassenger)
        
        if selectedPatient?.helmet == "yes" {
            helmetYes.selected = true
        }
        else {
            helmetNo.selected = true
        }
        
        if selectedPatient?.alcohol == "yes" {
            alcoholYes.selected = true
        }
        else {
            alcoholNo.selected = true
        }
        
        //History following trauma
        
        didLoseConsciousness.selected = checkBool(selectedPatient?.didLoseConsciousness)
        didHaveLucidInterval.selected = checkBool(selectedPatient?.didHaveLucidInterval)
        didHaveSeizures.selected = checkBool(selectedPatient?.didHaveSeizures)
        didVomit.selected = checkBool(selectedPatient?.didVomit)
        hasAmnesia.selected = checkBool(selectedPatient?.hasAmnesia)
        isBleedingFromEar.selected = checkBool(selectedPatient?.isBleedingFromEar)
        isBleedingFromNose.selected = checkBool(selectedPatient?.isBleedingFromNose)
        
        
        //Vital signs on arrival
        if selectedPatient?.airway == "clear" {
            airwayClear.selected = true
        }
        else {
            airwayRequiresIntubation.selected = true
        }
        
        if selectedPatient?.respiration == "normal" {
            respirationNormal.selected = true
        }
        if selectedPatient?.respiration == "tachy" {
            respirationTachypnoeic.selected = true
        }
        if selectedPatient?.respiration == "gasping" {
            respirationGasping.selected = true
        }
        
        if selectedPatient?.carotidPulsations == "left" {
            carotidPulsationsLeft.selected = true
        }
        else {
            carotidPulsationsRight.selected = true
        }

        
        pulseRatePerMin.text = selectedPatient?.pulseRatePerMin
        bpOnArrival.text = selectedPatient?.bpOnArrival
        bpAfterHalfHour.text = selectedPatient?.bpAfterHalfHour
        
        
        //Details of systematic examination
        
        
        csfRhin.selected = checkBool(selectedPatient?.csfRhin)
        otorrhoea.selected = checkBool(selectedPatient?.otorrhoea)
        activePeripheralBleeding.selected = checkBool(selectedPatient?.activePeripheralBleeding)
        fractures.selected = checkBool(selectedPatient?.fractures)
        peripheralPulses.selected = checkBool(selectedPatient?.peripheralPulses)
        chestInjury.selected = checkBool(selectedPatient?.chestInjury)
        abdominalInjury.selected = checkBool(selectedPatient?.abdominalInjury)
        wounds.selected = checkBool(selectedPatient?.wounds)
        
        
        //Details of spine examination
        spineTenderness.selected = checkBool(selectedPatient?.spineTenderness)
        spineDeformity.selected = checkBool(selectedPatient?.spineDeformity)
        
        //Neurological Examination
        
        eoScoreInitial.text = selectedPatient?.eoScoreInitial
        eoScoreAfter.text = selectedPatient?.eoScoreAfter
        
        mrScoreInitial.text = selectedPatient?.mrScoreInitial
        mrScoreAfter.text = selectedPatient?.mrScoreAfter
        
        
        vrScoreInitial.text = selectedPatient?.vrScoreInitial
        vrScoreAfter.text = selectedPatient?.vrScoreAfter
        
        totalInitial.text = selectedPatient?.totalInitial
        totalAfter.text = selectedPatient?.totalAfter
        
        if selectedPatient?.horRight == "present" {
            horRightPresent.selected = true
        }
        if selectedPatient?.horRight == "absent" {
            horRightAbsent.selected = true
        }
        if selectedPatient?.horRight == "nottested" {
            horRightNotTested.selected = true
        }
        
        if selectedPatient?.horLeft == "present" {
            horLeftPresent.selected = true
        }
        if selectedPatient?.horLeft == "absent" {
            horLeftAbsent.selected = true
        }
        if selectedPatient?.horLeft == "nottested" {
            horLeftNotTested.selected = true
        }
        
        plrRightmm.text = selectedPatient?.plrRightmm
        
        if selectedPatient?.plrRight == "normal" {
            plrRightNormal.selected = true
        }
        if selectedPatient?.plrRight == "sluggish" {
            plrRightSluggish.selected = true
        }
        if selectedPatient?.plrRight == "absent" {
            plrRightAbsent.selected = true
        }
        if selectedPatient?.plrRight == "cannotassess" {
            plrRightCannotAsses.selected = true
        }
       
        plrLeftmm.text = selectedPatient?.plrLeftmm
        
        if selectedPatient?.plrLeft == "normal" {
            plrLeftNormal.selected = true
        }
        if selectedPatient?.plrLeft == "sluggish" {
            plrLeftSluggish.selected = true
        }
        if selectedPatient?.plrLeft == "absent" {
            plrLeftAbsent.selected = true
        }
        if selectedPatient?.plrLeft == "cannotassess" {
            plrLeftCannotAssess.selected = true
        }
        
        mseUpperRightTone.text = selectedPatient?.mseUpperRightTone
        mseUpperLeftTone.text = selectedPatient?.mseUpperLeftTone
        mseUpperRightPower.text = selectedPatient?.mseUpperRightPower
        mseUpperLeftPower.text = selectedPatient?.mseUpperLeftPower
        
        
        mseLowerRightTone.text = selectedPatient?.mseLowerRightTone
        mseLowerLeftTone.text = selectedPatient?.mseLowerLeftTone
        mseLowerRightPower.text = selectedPatient?.mseLowerRightPower
        mseLowerLeftPower.text = selectedPatient?.mseLowerLeftPower
        
        //Clinical Impressions
        if selectedPatient?.changesInGCS == "yes" {
            changesInGCSYes.selected = true
        }
        else {
            changesInGCSNo.selected = true
        }
        
        ctScanHours.text = selectedPatient?.ctScanHours
     
        
        //Final Management Plan
        finalTime.text = selectedPatient?.finalTime
        finalDate.text = selectedPatient?.finalDate
        
        
        //Follow Up OPD
        
        followUpMon.selected = checkBool(selectedPatient?.followUpMon)
        followUpWed.selected = checkBool(selectedPatient?.followUpWed)
        followUpFri.selected = checkBool(selectedPatient?.followUpFri)
        

        if let points = selectedPatient?.ctScanPoints {
            for point in points {
                ctScanDrawView.lines.append(addPoint(point))
            }
            ctScanDrawView.setDisplay()
        }
        
        if let points = selectedPatient?.otherNeurologicalDeficits {
            for point in points {
                otherNeurologicalDeficits.lines.append(addPoint(point))
            }
            otherNeurologicalDeficits.setDisplay()
        }
        
        if let points = selectedPatient?.managementPlanPoints {
            for point in points {
                managementPlanView.lines.append(addPoint(point))
            }
            managementPlanView.setDisplay()
        }
        if let points = selectedPatient?.signature {
            for point in points {
                signature.lines.append(addPoint(point))
            }
            signature.setDisplay()
        }
        
        if let points = selectedPatient?.residentName {
            for point in points {
                residentNameView.lines.append(addPoint(point))
            }
            residentNameView.setDisplay()
        }
        
        if let points = selectedPatient?.hospitalCourse {
            for point in points {
                hospitalCourseView.lines.append(addPoint(point))
            }
            hospitalCourseView.setDisplay()
        }
        
        if let points = selectedPatient?.otherRelevantInfo {
            for point in points {
                otherRelevantInfoView.lines.append(addPoint(point))
            }
            otherRelevantInfoView.setDisplay()
        }
        
        if let points = selectedPatient?.conditionAtDischarge {
            for point in points {
                conditionAtDischarge.lines.append(addPoint(point))
            }
            conditionAtDischarge.setDisplay()
        }
        
        if let points = selectedPatient?.treatmentView {
            for point in points {
                treatmentView.lines.append(addPoint(point))
            }
            treatmentView.setDisplay()
        }

        if let points = selectedPatient?.finalSignatureView {
            for point in points {
                finalSignatureView.lines.append(addPoint(point))
            }
            finalSignatureView.setDisplay()
        }
        
        if let points = selectedPatient?.finalNameView {
            for point in points {
                finalNameView.lines.append(addPoint(point))
            }
            finalNameView.setDisplay()
        }
    }
    
    private func addPoint(point: Points) -> Line {
        var start = CGPoint()
        start.x = CGFloat(point.startX!)
        start.y = CGFloat(point.startY!)
        var end = CGPoint()
        end.x = CGFloat(point.endX!)
        end.y = CGFloat(point.endY!)
        
        let line = Line(start: start, end: end)
        return line
    }
    
    private func checkBool(value: Bool?) -> Bool {
        if let val = value {
            return val
        }
        return false
    }
    
    
    
    @IBAction func doneButtonClicked(sender: UIBarButtonItem) {
        save()
       navigationController?.popViewControllerAnimated(true)
    }
    
    //MARK: Drawview delegate method
    
    //TableView method
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    
    //MARK: UITextFieldDelegate
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func tableView(tableView: UITableView, shouldHighlightRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return false
    }
    
    override func scrollViewDidScroll(scrollView: UIScrollView) {
        //self.view.endEditing(true)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    
}
