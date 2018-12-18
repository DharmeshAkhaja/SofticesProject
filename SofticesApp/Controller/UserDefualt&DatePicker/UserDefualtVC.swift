//
//  UserDefualtVC.swift
//  SofticesApp
//
//  Created by sa13 on 27/10/18.
//  Copyright © 2018 sa13. All rights reserved.
//

import UIKit

class UserDefualtVC: UIViewController {
    
    @IBOutlet weak var txtTitle: UITextField!
    @IBOutlet weak var switchButton: UISwitch!
    @IBOutlet weak var btnOutlet: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(hexString: "#d69eaa")
        btnOutlet.layer.cornerRadius = btnOutlet.frame.size.height/3
        btnOutlet.clipsToBounds = true
        btnOutlet.backgroundColor = UIColor.darkGray
        btnOutlet.setTitleColor(UIColor.black, for: .normal)

        var switchStas = Bool()
        if (UserDefaults.standard.value(forKey: UserDefaultsKey.switchState) != nil ) {
            switchStas = UserDefaults.standard.value(forKey: UserDefaultsKey.switchState) as! Bool
            
        }
        if (UserDefaults.standard.value(forKey: UserDefaultsKey.textTitle) != nil) {
            txtTitle.text = UserDefaults.standard.value(forKey: UserDefaultsKey.textTitle) as! String
            
            switchButton.isOn = switchStas
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func switchChangedVlue(_ sender: Any) {
        print(switchButton.isOn)
        UserDefaults.standard.set(switchButton.isOn, forKey: UserDefaultsKey.switchState)

    }
    
    @IBAction func btnActionSave(_ sender: Any) {
        UserDefaults.standard.set(txtTitle.text, forKey: UserDefaultsKey.textTitle)
        
    }
    @IBAction func btnActionBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
  
}
