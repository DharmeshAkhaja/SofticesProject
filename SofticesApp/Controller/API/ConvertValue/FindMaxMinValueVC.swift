//
//  FindMaxMinValueVC.swift
//  SofticesApp
//
//  Created by sa13 on 23/10/18.
//  Copyright © 2018 sa13. All rights reserved.
//

import UIKit

class FindMaxMinValueVC: UIViewController {

    
    @IBOutlet weak var txtValue: UITextField!
    @IBOutlet weak var lblMaxValue: UILabel!
    @IBOutlet weak var lblMinValue: UILabel!
    @IBOutlet weak var btnMaxValue: UIButton!
    @IBOutlet weak var btnMinValue: UIButton!
    
    var arrData: [String] = []
    var intDataArr: [Int] = []
    
    var SelectedBtnTag: Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnActionMax(_ sender: Any) {
        
        SelectedBtnTag = 1
        SortingFunction()
        
    }
    
    @IBAction func btnActionMin(_ sender: Any) {
       
        SelectedBtnTag = 2
     SortingFunction()
    }
    
    func SortingFunction() {
        if !(txtValue.text?.isEmpty)! {
        let strData = txtValue.text
        arrData = strData!.components(separatedBy: ",")
        var tempData: [Int] = []
        for data in arrData {
            let intData = Int(data)
            tempData.append(intData!)
        }
        
        intDataArr = tempData.sorted(by: {$0 > $1} )
            if SelectedBtnTag == 1 {
                lblMaxValue.text = "\((intDataArr.first)!)"
            }
            else {
                self.lblMinValue.text = "\((self.intDataArr.last)!)"
            }
    }
        else {
            print("please Enter Value")
            let alert = UIAlertController(title: "Notice", message: "Please Enter Value", preferredStyle: UIAlertControllerStyle.alert)
            
            // add the actions (buttons)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            
            // show the alert
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    @IBAction func btnActionBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
