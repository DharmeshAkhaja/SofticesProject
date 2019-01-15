//
//  DatePickerVC.swift
//  SofticesApp
//
//  Created by sa13 on 27/10/18.
//  Copyright © 2018 sa13. All rights reserved.
//

import UIKit

class DatePickerVC: UIViewController {
    
    

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var btnDate: UIButton!
    @IBOutlet weak var btnTime: UIButton!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var viewBotttom: NSLayoutConstraint!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var lblTime: UILabel!
    
    
    let formetter = DateFormatter()
    var senderButton = UIButton()
 
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor(hexString: "#d69eaa")
        btnDate.layer.cornerRadius = btnDate.frame.size.height/3
        btnDate.clipsToBounds = true
        btnDate.backgroundColor = UIColor.gray
        btnTime.layer.cornerRadius = btnDate.frame.size.height/3
        btnTime.clipsToBounds = true
        btnTime.backgroundColor = UIColor.gray
        btnDate.setTitleColor(UIColor.black, for: .normal)
        btnTime.setTitleColor(UIColor.black, for: .normal)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBAction func btnActionDate(_ sender: Any) {
    
        senderButton = btnDate
        datePicker.tag = 1
        datePicker.datePickerMode = .date
        UIView.animate(withDuration: 0.3) {
            self.viewBotttom.constant = 0
            self.view.layoutIfNeeded()
        }
        
    }
    
    @IBAction func btnActionTime(_ sender: Any) {
  
        senderButton = btnTime
        datePicker.tag = 2
        datePicker.datePickerMode = .time
        UIView.animate(withDuration: 0.3){
            self.viewBotttom.constant = 0
            self.view.layoutIfNeeded()
        }
    }
    
    @IBAction func btnActionCancel(_ sender: Any) {
        UIView.animate(withDuration: 0.3) {
            
            
            self.viewBotttom.constant = 220
            
            self.view.layoutIfNeeded()
        }
    }
    
    @IBAction func btnActionDone(_ sender: Any) {
        UIView.animate(withDuration: 0.3) {
            self.viewBotttom.constant = 220
            self.view.layoutIfNeeded()
        }
        
        if datePicker.tag == 1 {
            formetter.dateFormat = "dd,MM,yyyy"
//            btnDate.setTitle(formetter.string(from: datePicker.date), for: .normal)
            lblDate.text = formetter.string(from: datePicker.date)
        }
        else{
            formetter.dateFormat = "hh:mm:ss: a"
//            btnTime.setTitle(formetter.string(from: datePicker.date), for: .normal)
            lblTime.text = formetter.string(from: datePicker.date)
            
            
        }
  
    }
    
    
    @IBAction func btnActionBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        
    }
}
