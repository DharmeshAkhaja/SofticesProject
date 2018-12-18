//
//  StudentDetailVC.swift
//  SofticesApp
//
//  Created by sa13 on 25/10/18.
//  Copyright © 2018 sa13. All rights reserved.
//

import UIKit
import RealmSwift

class StudentDetailVC: UIViewController {

    var data = Student()
    
    @IBOutlet weak var txtFirstName: UITextField!
    @IBOutlet weak var txtLastName: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPhoneNo: UITextField!
    @IBOutlet weak var txtBranch: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        txtFirstName.text = data.First_Name
        txtLastName.text = data.Last_Name
        txtEmail.text = data.Email
        txtPhoneNo.text = data.Phone
        txtBranch.text = data.Branch
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func btnActionBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    

}
