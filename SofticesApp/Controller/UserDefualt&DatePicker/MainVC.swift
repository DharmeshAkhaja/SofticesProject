//
//  MainVC.swift
//  SofticesApp
//
//  Created by sa13 on 29/10/18.
//  Copyright © 2018 sa13. All rights reserved.
//

import UIKit

class MainVC: UIViewController {

    @IBOutlet weak var btnUserDefualt: UIButton!
    @IBOutlet weak var btnDatePicker: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(hexString: "#9dafcc")
        btnUserDefualt.layer.cornerRadius = btnUserDefualt.frame.size.height/4
        btnUserDefualt.clipsToBounds = true
        btnUserDefualt.backgroundColor = UIColor.gray
        btnUserDefualt.setTitleColor(UIColor.black, for: .normal)
        
        btnDatePicker.layer.cornerRadius = btnDatePicker.frame.size.height/4
        btnDatePicker.clipsToBounds = true
        btnDatePicker.backgroundColor = UIColor.gray
        btnDatePicker.setTitleColor(UIColor.black, for: .normal)

      
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func btnActionUserDefualt(_ sender: Any) {
        let storyboard = UIStoryboard(name: "UserDefualt", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "UserDefualtVC") as! UserDefualtVC
        present(vc, animated: true, completion: nil)
    
        
    }
    
    @IBAction func btnActionDatePicker(_ sender: Any) {
        let storyboard = UIStoryboard(name: "UserDefualt", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "DatePickerVC") as! DatePickerVC
        present(vc, animated: true, completion: nil)
    
    }
    @IBAction func btnActionBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
