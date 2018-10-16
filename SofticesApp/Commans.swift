//
//  Commans.swift
//  SofticesApp
//
//  Created by sa13 on 10/10/18.
//  Copyright © 2018 sa13. All rights reserved.
//
import UIKit
import Foundation
let common = commons()
class commons: NSObject {
    
    //static let shared = commons()
    
    func alertbox(title:String,message:String,btnTitle:String,VC:ViewController) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: btnTitle, style: UIAlertActionStyle.default, handler: nil))
       VC.present(alert, animated: true, completion: nil)
        
    }
    
}
