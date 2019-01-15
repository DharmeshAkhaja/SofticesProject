//
//  AddNewContactVC.swift
//  SofticesApp
//
//  Created by sa13 on 22/12/18.
//  Copyright © 2018 sa13. All rights reserved.
//

import UIKit

class AddNewContactVC: UIViewController {

    @IBOutlet weak var txtTitle: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func btnActionFacebook(_ sender: UIButton) {
        
        let activityControler = UIActivityViewController(activityItems: [txtTitle.text! ], applicationActivities: nil)
        present(activityControler, animated: true, completion: nil)
    }
    
    @IBAction func btnActionWhatsApp(_ sender: UIButton) {
        
        let urlString = "Hello Friends, Sharing some data here... !"
        let urlStringEncoded = urlString.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed)
        let url  = URL(string: "whatsapp://send?text=\(urlStringEncoded!)")
        
        if UIApplication.shared.canOpenURL(url!) {
            UIApplication.shared.open(url as! URL, options: [:]) { (success) in
                if success {
                    print("WhatsApp accessed successfully")
                } else {
                    print("Error accessing WhatsApp")
                }
            }
        }
    }
    
    @IBAction func btnActionShare(_ sender: UIButton) {
        
        let image = UIImage(named: "images")
        let mesageStr = "Dharam IOS"
        let activityViewController = UIActivityViewController(activityItems: [image, mesageStr], applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view
        activityViewController.excludedActivityTypes = [ UIActivityType.airDrop, UIActivityType.postToFacebook ]
        
        self.present(activityViewController, animated: true, completion: nil)
        
        
    }
    
    @IBAction func btnActionCancel(_ sender: UIButton) {
        
        dismiss(animated: true, completion: nil)
    }
    
    
}
