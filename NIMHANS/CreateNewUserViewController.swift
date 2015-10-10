//
//  CreateNewUserViewController.swift
//  NIMHANS
//
//  Created by Jaison Titus on 07/10/15.
//  Copyright © 2015 foofys. All rights reserved.
//

import UIKit
import CoreData
import Foundation

class CreateNewUserViewController: UIViewController {
    
    @IBOutlet weak var firstName: UITextField!
    
    @IBOutlet weak var userName: UITextField!
    
    @IBOutlet weak var password: UITextField!

    @IBOutlet weak var confirmPassword: UITextField!
    
    
    @IBAction func createNewUser(sender: UIButton) {
        if firstName.text == "" || userName.text == "" || password.text == "" || confirmPassword.text == "" {
            showAlert("No fields can be left empty",doneCreatingNewUser: false)
        }
        else {
            addUserToDB()
        }
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapper = UITapGestureRecognizer(target: self, action: "hideKeyboard:")
        tapper.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tapper)
        
    }
    
    //MARK: TapGestureRecogniser Method
    func hideKeyboard(recognizer: UITapGestureRecognizer) {
        password.resignFirstResponder()
        userName.resignFirstResponder()
        confirmPassword.resignFirstResponder()
        firstName.resignFirstResponder()
    }
    
    private func showAlert(message: String,doneCreatingNewUser: Bool) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        let dismiss = UIAlertAction(title: message, style: UIAlertActionStyle.Cancel) { (action) -> Void in
            if doneCreatingNewUser {
                self.dismissViewControllerAnimated(true, completion: nil)
            }
        }
        alert.addAction(dismiss)
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    private func addUserToDB() {
        let appDelegate =
        UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        
        let newUserEntry =
        NSEntityDescription.insertNewObjectForEntityForName("UserDetails", inManagedObjectContext: managedContext) as! UserDetails
        
        newUserEntry.userName = userName.text
        newUserEntry.userPassword = password.text
        newUserEntry.patientInformation = nil
        do {
            try managedContext.save()
            showAlert(firstName.text! + " your account has been successfully created",doneCreatingNewUser: true)
        }
        catch {
            let nserror = error as NSError
            NSLog("Unresolved error \(nserror), \(nserror.userInfo)")
        }
        
    }
    
    @IBAction func cancelClicked(sender: UIBarButtonItem) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    
}
