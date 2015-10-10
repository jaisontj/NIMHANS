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
                    if currentUser?.password == self.passWord.text {
                        self.authenticateUserWithBiometrics()
                    }
                    else {
                        invokeAlertMethod("Incorrect password", msgBody: "Please re-enter your password,correctly", delegate: self)
                    }
                }
                else {
                    invokeAlertMethod("Unregistered User", msgBody: "Please check your username or create a new account ", delegate: self)
                }
            })
        }
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



