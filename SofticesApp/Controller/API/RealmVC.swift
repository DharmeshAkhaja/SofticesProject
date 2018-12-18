//
//  RealmVC.swift
//  SofticesApp
//
//  Created by sa13 on 25/10/18.
//  Copyright © 2018 sa13. All rights reserved.
//

import UIKit
import RealmSwift

class RealmVC: UIViewController {
    
    var student = Student()
    var realm: Realm!
    
    @IBOutlet weak var txtFirstName: UITextField!
    @IBOutlet weak var txtLastName: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPhoneNo: UITextField!
    @IBOutlet weak var txtBranch: UITextField!
    
    @IBOutlet weak var btnAdd: UIButton!
    @IBOutlet weak var btnAllRecord: UIButton!
    @IBOutlet weak var btnPrint: UIButton!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        realm = try! Realm()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnActionAdd(_ sender: Any) {
        if isValidate() {
            let alert = UIAlertController(title: "Alert", message: "successfully Add Data", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
            student.First_Name = txtFirstName.text!
            student.Last_Name = txtLastName.text!
            student.Email = txtEmail.text!
            student.Phone = txtPhoneNo.text!
            student.Branch = txtBranch.text!
            
            try! self.realm.write {
                self.realm.add(student)
            }
         
        }
        else {
            let alert = UIAlertController(title: "Alert", message: "Please Enter All Data", preferredStyle: UIAlertControllerStyle.alert)
             alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
        }
        
        
    }
    
    @IBAction func btnActionAllRecord(_ sender: Any) {
        let storyboard = UIStoryboard(name: "API", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "StudentListVC") as! StudentListVC
        self.present(vc, animated: true, completion: nil)
        
        
    }
    
    @IBAction func btnActionPrint(_ sender: Any) {
        var data: Results<Student>{
            get {
                return realm.objects(Student.self)
            }
        }
        print(data)
    }
 
    func isValidate() -> Bool {
        for txt in [txtFirstName, txtLastName, txtEmail, txtPhoneNo, txtBranch] {
            if txt?.text?.count == 0 {
                return false
            }
            
        }
        return true
    }
    
    @IBAction func btnActionBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
        
    }
}
