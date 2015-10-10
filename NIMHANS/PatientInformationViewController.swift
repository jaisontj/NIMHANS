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
        setDelegates()
                
        if shouldDisplayPatientInfo {
            displayPatientInformation()
        }
    }
    
    func setDelegates() {
        ctScanDrawView.delegate = self
        otherNeurologicalDeficits.delegate = self
        managementPlanView.delegate = self
        signature.delegate = self
        residentNameView.delegate = self
        otherRelevantInfoView.delegate = self
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
        setButton(writeCTScan)
        
        //Follow Up OPD
        
        setButton(followUpMon)
        setButton(followUpWed)
        setButton(followUpFri)
        
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
                
                patientEntry.name = patient.name
                patientEntry.age = patient.age
                patientEntry.referredFrom = patient.referredFrom
                patientEntry.placeOfInjury = patient.placeOfInjury
                patientEntry.gender = patient.gender
                patientEntry.isRTA = patient.isRTA
                
                for ctScanPoint in patient.ctScanPoints {
                    let ctScanPointEntry =
                    NSEntityDescription.insertNewObjectForEntityForName("LinePoints", inManagedObjectContext: managedContext) as! LinePoints
                    
                    ctScanPointEntry.startX = ctScanPoint.startX
                    ctScanPointEntry.startY = ctScanPoint.startY
                    ctScanPointEntry.endX = ctScanPoint.endX
                    ctScanPointEntry.endY = ctScanPoint.endY
                    
                    patientEntry.addCTScanPoints(ctScanPointEntry)

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
        
        for ctScanPoint in ctScanDrawView.lines {
            let ctScanPointEntry =
            NSEntityDescription.insertNewObjectForEntityForName("LinePoints", inManagedObjectContext: managedContext) as! LinePoints
            
            ctScanPointEntry.startX = Float(ctScanPoint.start.x)
            ctScanPointEntry.startY = Float(ctScanPoint.start.y)
            ctScanPointEntry.endX = Float(ctScanPoint.end.x)
            ctScanPointEntry.endY = Float(ctScanPoint.end.y)
            
            patientEntry.addCTScanPoints(ctScanPointEntry)
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
        
        isRTA.selected = checkBool(selectedPatient?.isRTA)
        isAssault.selected = checkBool(selectedPatient?.isAssault)
        isFall.selected = checkBool(selectedPatient?.isFall)
        isOther.selected = checkBool(selectedPatient?.isOther)
        
        if let ctScanPoints = selectedPatient?.ctScanPoints {
            for ctScanPoint in ctScanPoints {
                var start = CGPoint()
                start.x = CGFloat(ctScanPoint.startX!)
                start.y = CGFloat(ctScanPoint.startY!)
                var end = CGPoint()
                end.x = CGFloat(ctScanPoint.endX!)
                end.y = CGFloat(ctScanPoint.endY!)
                
                let line = Line(start: start, end: end)
                ctScanDrawView.lines.append(line)
            }
        }
        ctScanDrawView.setDisplay()
    }
    
    private func checkBool(value: Bool?) -> Bool {
        if let val = value {
            return val
        }
        return false
    }
    
    
    
    @IBAction func doneButtonClicked(sender: UIBarButtonItem) {
        save()
        self.dismissViewControllerAnimated(true, completion: nil)
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
    
    override func tableView(tableView: UITableView, shouldHighlightRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return false
    }
    
    override func scrollViewDidScroll(scrollView: UIScrollView) {
        //self.view.endEditing(true)
    }
    
    
    
}
