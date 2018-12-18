//
//  LoginPageVC.swift
//  SofticesApp
//
//  Created by sa13 on 09/10/18.
//  Copyright © 2018 sa13. All rights reserved.
//

import UIKit

class LoginPageVC: UIViewController {
    
    @IBOutlet weak var txtUserID: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnActionLogin(_ sender: Any) {
        if isValidate() {
            let storyBoard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyBoard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
            self.navigationController?.pushViewController(vc, animated: true)
            present(vc, animated: true, completion: nil)
        }
        else{
//            print("enter Value")
            let alert = UIAlertController(title: "Notice", message: "Please Enter Valid Data", preferredStyle: UIAlertControllerStyle.alert)
            
            // add the actions (buttons)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            
            // show the alert
            self.present(alert, animated: true, completion: nil)
            
        }
        
        
    }
    
    
    func isValidate() -> Bool {
        
        if txtUserID.text != "" {
            let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
            
            let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
            return emailTest.evaluate(with: txtUserID.text)
        }
        else {
            return false
        }
        isValidEmail(testStr: txtUserID.text!)
        
        if (txtPassword.text?.count)! < 8  {
            return false
        }
        return true
    }
    
    
    func isValidEmail(testStr:String) -> Bool {
        return true
    }
    
    @IBAction func Register(_ sender: Any) {
        let storyboard = UIStoryboard(name: "LoginPage", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "loginDemoVC") as! loginDemoVC
        self.present(vc, animated: true, completion: nil)
    }
    
    
}
