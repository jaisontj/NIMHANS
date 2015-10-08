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
            print("field empty")
            showAlert("No fields can be left empty")
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
    
    private func showAlert(message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        let dismiss = UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Cancel, handler: nil)
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
        
        do {
            try managedContext.save()
            showAlert(firstName.text! + "your account has been successfully created")
        }
        catch {
            let nserror = error as NSError
            NSLog("Unresolved error \(nserror), \(nserror.userInfo)")
        }
        
    }
}
