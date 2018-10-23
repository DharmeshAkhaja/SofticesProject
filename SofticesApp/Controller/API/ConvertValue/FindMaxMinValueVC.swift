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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnActionMax(_ sender: Any) {
        SortingFunction()
        lblMaxValue.text = "\((intDataArr.first)!)"
        
    }
    
    @IBAction func btnActionMin(_ sender: Any) {
        SortingFunction()
        DispatchQueue.main.async {
            self.lblMinValue.text = "\((self.intDataArr.last)!)"
        }
        
    }
    
    func SortingFunction() {
        let strData = txtValue.text
        arrData = strData!.components(separatedBy: ",")
        var tempData: [Int] = []
        for data in arrData {
            let intData = Int(data)
            tempData.append(intData!)
        }
        
        intDataArr = tempData.sorted(by: {$0 > $1} )
    }
    

}
