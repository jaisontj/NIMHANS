//
//  LogInViewController.swift
//  NIMHANS
//
//  Created by Jaison Titus on 06/10/15.
//  Copyright © 2015 foofys. All rights reserved.
//

import UIKit
import CoreData
import LocalAuthentication


class LogInViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var passWord: UITextField!
    @IBOutlet weak var userName: UITextField!
    
    
    var currentUser: UserInformation?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapper = UITapGestureRecognizer(target: self, action: "hideKeyboard:")
        tapper.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tapper)

    }
    
    //MARK: TapGestureRecogniser Method
    func hideKeyboard(recognizer: UITapGestureRecognizer) {
        passWord.resignFirstResponder()
        userName.resignFirstResponder()
    }
    
    //MARK: UITextFieldDelegate
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func logInButtonClicked(sender: UIButton) {
        checkLogInCredentials()
    }
    
    private func checkLogInCredentials() {
        if let docUserName = userName.text {
            fetchDataForUserName(docUserName, callback: { (isUserNamePresentInDB) -> Void in
                if isUserNamePresentInDB {
                    if self.currentUser?.password == self.passWord.text {
                        self.authenticateUserWithBiometrics()
                    }
                    else {
                        self.showAlert("Password is Incorrect")
                    }
                }
                else {
                    self.showAlert("Unregistered User")
                }
            })
        }
    }
    
    private func fetchDataForUserName(name: String,callback: (Bool) -> Void) {
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
    
    private func showAlert(message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        let tryAgainAction = UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Cancel, handler: nil)
        alert.addAction(tryAgainAction)
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    func authenticateUserWithBiometrics() {
        let context = LAContext()
        context.localizedFallbackTitle = ""
        let reasonString = "Authentication is needed to access your account"
        
        do {
            _ = try context.canEvaluatePolicy(LAPolicy.DeviceOwnerAuthenticationWithBiometrics)
            [context.evaluatePolicy(LAPolicy.DeviceOwnerAuthenticationWithBiometrics, localizedReason: reasonString, reply: { (success, evalPolicyError) -> Void in
                if success {
                    self.logUserIn()
                }
                else {
                    // If authentication failed then show a message to the console with a short description.
                    // In case that the error is a user fallback, then show the password alert view.
                    print(evalPolicyError?.localizedDescription)
                    
                    switch evalPolicyError!.code {
                        
                    case LAError.SystemCancel.rawValue:
                        print("Authentication was cancelled by the system")
                        
                    case LAError.UserCancel.rawValue:
                        print("Authentication was cancelled by the user")
                        
                    case LAError.UserFallback.rawValue:
                        print("User selected to enter custom password")
                        
                    default:
                        print("Authentication failed")
                    }
                }
            })]
        }
        catch let error as NSError{
            // If the security policy cannot be evaluated then show a short message depending on the error.
            switch error.code{
                
            case LAError.TouchIDNotEnrolled.rawValue:
                print("TouchID is not enrolled")
                
            case LAError.PasscodeNotSet.rawValue:
                print("A passcode has not been set")
                
            default:
                // The LAError.TouchIDNotAvailable case.
                print("TouchID not available")
            }
            
            // Optionally the error description can be displayed on the console.
            print(error.localizedDescription)
            
        }
    }
    
    private func logUserIn() {
        self.performSegueWithIdentifier("showsPatientListVC", sender: nil)
    }
    
    
        
}



