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
        if txtUserID.text == "admin" && txtPassword.text == "12345" {
            let storyBoard = UIStoryboard(name: "Main", bundle: nil)
                    let controller = storyBoard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
                    self.navigationController?.pushViewController(controller, animated: true)
                    self.present(controller, animated: true, completion: nil)
        }
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
