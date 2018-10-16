//
//  GoogleSignInVC.swift
//  SofticesApp
//
//  Created by sa13 on 13/10/18.
//  Copyright © 2018 sa13. All rights reserved.
//

import UIKit
import GoogleSignIn
import FacebookCore
import FacebookLogin

class GoogleSignInVC: UIViewController,GIDSignInUIDelegate,GIDSignInDelegate {
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var btnSignIn: UIButton!
    @IBOutlet weak var btnFacebookSignIn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        GIDSignIn.sharedInstance().delegate = self
        GIDSignIn.sharedInstance().uiDelegate = self
         lblTitle.text = "Initialized Swift App"
        
        if isKeyPresentInUserDefaults(key: "email"){
            
            let story = UIStoryboard.init(name: "GoogleMap", bundle: nil)
            let VC = story.instantiateViewController(withIdentifier: "UserDetailsVc") as! UserDetailsVc
            self.present(VC, animated: true, completion: nil)
            
        }
       
    }
    
    //    MARK :- SIGNIN WITH FACEBOOK
    
    @IBAction func btnActionFacebookLogin(_ sender: Any) {
        
        
    
    }
    
    
    //    MARK :- SIGNIN IN WITH GOOGLE

    @IBAction func btnActionSignIn(_ sender: Any) {
        GIDSignIn.sharedInstance().signIn()
        
    }
   
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!,
              withError error: Error!) {
        if let error = error {
            print("\(error.localizedDescription)")
        } else {
            // Perform any operations on signed in user here.
            let userId = user.userID                  // For client-side use only!
            let idToken = user.authentication.idToken // Safe to send to the server
            let fullName = user.profile.name
            let givenName = user.profile.givenName
            let familyName = user.profile.familyName
            let email = user.profile.email
            UserDefaults.standard.set(email, forKey: "email")
            UserDefaults.standard.set(fullName, forKey: "fullName")
            UserDefaults.standard.set(userId, forKey: "userId")
            UserDefaults.standard.set(givenName, forKey: "givenName")
            
            if isKeyPresentInUserDefaults(key: "email"){
                
                let story = UIStoryboard.init(name: "GoogleMap", bundle: nil)
                let VC = story.instantiateViewController(withIdentifier: "UserDetailsVc") as! UserDetailsVc
                //self.navigationController?.pushViewController(VC, animated: true)
                self.present(VC, animated: true, completion: nil)
            }
            
        }
    }
    func isKeyPresentInUserDefaults(key: String) -> Bool {
        return UserDefaults.standard.object(forKey: key) != nil
    }
}
