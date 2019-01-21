//
//  loginDemoVC.swift
//  SofticesApp
//
//  Created by sa13 on 10/10/18.
//  Copyright © 2018 sa13. All rights reserved.
//

import UIKit
import Firebase

class loginDemoVC: UIViewController {
    
    @IBOutlet weak var txtFirstName: UITextField!
    @IBOutlet weak var txtLastName: UITextField!
    @IBOutlet weak var txtEmailID: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtPhoneNo: UITextField!
    @IBOutlet weak var txtAge: UITextField!
    
    
    @IBOutlet weak var btnOutletSingUp: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btnOutletSingUp.layer.cornerRadius = btnOutletSingUp.frame.size.height/2
        btnOutletSingUp.clipsToBounds = true
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
       
    }
    
    @IBAction func btnActionSingUp(_ sender: Any) {
        
        Auth.auth().createUser(withEmail: txtEmailID.text!, password: txtPassword.text!) { (user, err) in
            if err != nil {
                print(err)
                return
            }
            
            print(user)
            
            guard let uid = Auth.auth().currentUser?.uid else {
                return
            }
            let ref = Database.database().reference(fromURL: "https://dakhaja-8aa0b.firebaseio.com")
            let userRef = ref.child("User").child(uid)
            let value = ["FirstName": self.txtLastName.text!,"LastName": self.txtLastName.text! ,"email": self.txtEmailID.text!,"PhoneNo": self.txtPhoneNo.text!,"Age": self.txtAge.text!] as [String: Any]
            userRef.updateChildValues(value, withCompletionBlock: { (error, ref) in
                if error != nil {
                    print(error)
                    return
                }
                print(ref)
                let storyboard = UIStoryboard (name: "LoginPage", bundle: nil)
                let vc = storyboard.instantiateViewController(withIdentifier: "LoginPageVC") as! LoginPageVC
                self.present(vc, animated: true, completion: nil)
            })
        }
        
       
    }
    
    @IBAction func btnActionBAck(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
