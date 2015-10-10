//
//  PatientListViewController.swift
//  NIMHANS
//
//  Created by Jaison Titus on 08/10/15.
//  Copyright © 2015 foofys. All rights reserved.
//

import UIKit
import Foundation
import CoreData

class PatientListViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        if didAddNewPatient {
            if let username = currentUser?.userName {
                fetchDataForUserName(username, callback: { (done) -> Void in
                        if done {
                            self.tableView.reloadData()
                            didAddNewPatient = false
                        }
                    })
                }
            }
        }
    
    @IBAction func logOutClicked(sender: UIBarButtonItem) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func addPatientClicked(sender: UIBarButtonItem) {
        self.performSegueWithIdentifier("showsPatientDetails", sender: nil)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let count = currentUser?.patientDetails.count {
            print("inside count")
            return count
        }
        else {
            print("message label add")
            addMessageLabel()
        }
        return 0
    }
    
    private func addMessageLabel() {
        let messageLabel = UILabel()
        messageLabel.frame = CGRectMake(0.0, 0.0, self.view.frame.size.width, self.view.frame.size.height)
        messageLabel.textAlignment = NSTextAlignment.Center
        messageLabel.text = "Schedule for this Event has not been decided yet"
        messageLabel.textColor = UIColor.grayColor()
        messageLabel.font = UIFont(name: "Helvetica", size: 25)
        messageLabel.numberOfLines = 0
        view.addSubview(messageLabel)
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("patientName", forIndexPath: indexPath) as UITableViewCell
        cell.textLabel?.text = currentUser?.patientDetails[indexPath.row].name
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        shouldDisplayPatientInfo = true
        selectedPatient = currentUser?.patientDetails[indexPath.row]
        self.performSegueWithIdentifier("showsPatientDetails", sender: nil)
    }
    
    
}
