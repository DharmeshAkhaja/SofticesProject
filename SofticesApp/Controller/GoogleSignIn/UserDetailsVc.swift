//
//  UserDetailsVc.swift
//  SofticesApp
//
//  Created by sa13 on 13/10/18.
//  Copyright © 2018 sa13. All rights reserved.
//

import UIKit
import GoogleSignIn

class UserDetailsVc: UIViewController,GIDSignInUIDelegate{

    @IBOutlet weak var lbfullname: UILabel!
    @IBOutlet weak var lbemail: UILabel!
    @IBOutlet weak var btnsingout: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btnsingout.layer.cornerRadius=10
        lbfullname.text = UserDefaults.standard.string(forKey:"fullName")
        lbemail.text = UserDefaults.standard.string(forKey: "email")
    }

    
    
    @IBAction func singoutclicked(_ sender: Any) {
        GIDSignIn.sharedInstance().signOut()
        UserDefaults.standard.removeObject(forKey: "email")
        UserDefaults.standard.removeObject(forKey: "fullName")
        
        let story = UIStoryboard.init(name: "GoogleMap", bundle: nil)
        let VC = story.instantiateViewController(withIdentifier: "GoogleSignInVC") as! GoogleSignInVC
        //self.navigationController?.pushViewController(VC, animated: true)
        self.present(VC, animated: true, completion: nil)
        
    }
    
 
 
}
