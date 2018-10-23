//
//  ConvertValueVC.swift
//  SofticesApp
//
//  Created by sa13 on 23/10/18.
//  Copyright © 2018 sa13. All rights reserved.
//

import UIKit

class ConvertValueVC: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate,UITextFieldDelegate {
    

    @IBOutlet weak var btnFrom: UIButton!
    @IBOutlet weak var btnTo: UIButton!
    @IBOutlet weak var lblValue: UILabel!
    @IBOutlet weak var lblResult: UILabel!
    @IBOutlet weak var txtValue: UITextField!
    @IBOutlet weak var lbl1: UILabel!
    @IBOutlet weak var lbl2: UILabel!
    @IBOutlet weak var lbl3: UILabel!
    @IBOutlet weak var btnConvert: UIButton!
    @IBOutlet weak var datePick: UIPickerView!
    @IBOutlet weak var pickerContent: UIView!
    @IBOutlet weak var PickerConetntBottom: NSLayoutConstraint!
    
    var tempData: String = ""
    let arrData: [String] = ["cm","inch"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.hideKeyboardWhenTappedAround()
        
        self.datePick.dataSource = self
        self.datePick.delegate = self
        self.txtValue.delegate = self

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        print("TextField should begin editing method called")
        hideOrShowPicker(show: false)
        return true
    }
 
    @IBAction func btnActionFrom(_ sender: Any) {
        
        hideOrShowPicker(show: true)
        datePick.tag = 1
        
    
    }
    
    
     @IBAction func btnActionTo(_ sender: Any) {
        
        hideOrShowPicker(show: true)
        datePick.tag = 2
        
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
        
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return arrData.count
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return arrData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        tempData = arrData[row]
    }
    
    @IBAction func btnActionDone(_ sender: Any) {
        hideOrShowPicker(show: false)
        let row = datePick.selectedRow(inComponent: 0)
        pickerView(datePick, didSelectRow: row, inComponent: 0)
        if datePick.tag == 1 {
            lbl2.text = tempData
        }
        else{
            lbl3.text = tempData
        }
        
    }
    
    @IBAction func btnActionCancel(_ sender: Any) {
        
        hideOrShowPicker(show: false)
    }
    
    
    @IBAction func btnActionConvert(_ sender: Any) {
        if txtValue.text?.count != 0 && lbl2.text != nil && !(lbl3.text?.isEmpty)! {
            if lbl2.text == "cm"{
                if lbl3.text == "cm"{
                    lbl1.text = txtValue.text
                }
                else{
                    let result = Double(txtValue.text!)!/2.54
                    lbl1.text = "\(result)"
                }
                
            }
            else{
                if lbl3.text == "cm"{
                    let result = Double(txtValue.text!)!*2.54
                    lbl1.text = "\(result)"
                }
                else{
                    lbl1.text = txtValue.text
                    
                }
            }
        }
    }
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        var newStr = NSString(string: textField.text!).replacingCharacters(in: range, with: string)
        if lbl2.text != nil && !(lbl3.text?.isEmpty)! {
            if newStr == "" {
                newStr = "0"
            }
            if lbl2.text == "cm" {
                if lbl3.text == "cm" {
                    lbl1.text = newStr
                }
                else {
                    let result = Double(newStr)!/2.54
                    lbl1.text = "\(result)"
                }
            }
            else {
                if lbl3.text == "cm" {
                    let result = Double(newStr)!*2.54
                    lbl1.text = "\(result)"
                }
                else {
                    lbl1.text = newStr
                }
            }
        }
        return true
    }
    
    
    
    
    
    func hideOrShowPicker(show: Bool) {
        view.endEditing(true)
        if show {
            UIView.animate(withDuration: 0.3) {
                self.PickerConetntBottom.constant=0
                self.view.layoutIfNeeded()
            }
        }
        else {
            UIView.animate(withDuration: 0.3) {
                self.PickerConetntBottom.constant=230
                self.view.layoutIfNeeded()
            }
        }
    }
    
    @IBAction func btnActionBack(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }
}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}


