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
    
    @IBAction func logOutClicked(sender: UIBarButtonItem) {
        
    }
    
    @IBAction func addPatientClicked(sender: UIBarButtonItem) {
        self.performSegueWithIdentifier("showsPatientDetails", sender: nil)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let count = currentUser?.patientDetails.count {
            return count
        }
        return 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("patientName", forIndexPath: indexPath) as UITableViewCell
        cell.textLabel?.text = currentUser?.patientDetails[indexPath.row].name
        return cell
    }
    
    
}
