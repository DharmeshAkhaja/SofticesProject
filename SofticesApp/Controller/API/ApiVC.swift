//
//  ApiVC.swift
//  SofticesApp
//
//  Created by sa13 on 01/10/18.
//  Copyright © 2018 sa13. All rights reserved.
//

import UIKit
import Alamofire

class ApiVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    @IBOutlet weak var tblApi: UITableView!
    
    var arrData = [NSDictionary]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        tblApi.dataSource = self
        tblApi.delegate = self
        tblApi.tableFooterView = UIView()
        tblApi.separatorStyle = .none
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //    MARK:- TABLE VIEW
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblApi.dequeueReusableCell(withIdentifier: "ApiCell") as! ApiCell
        
        let data = arrData[indexPath.row]
        
        cell.lblTitle.text = data.value(forKey: "first_name") as? String
        
        return cell
        
    }
    
    //    MARK:- BTN ACTION
    
    @IBAction func btnActionGet(_ sender: Any) {
        
        let url = "https://reqres.in/api/users?page=2"
    
//        print(url)
        
//        let param = ["user": "sdfklhsldkfhl", "password": "12345678"]
        
//        let header = ["content-type": "application/json","access-token": "12345678976649807"]
        
//        print(param)
        
        Alamofire.request(url,method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON { (response) in
            
            switch(response.result) {
            case .success(_):
                if response.result.value != nil
                {
                    let response = response.result.value! as! NSDictionary
                    self.arrData = response.value(forKey: "data") as! [NSDictionary]                    
                    print(self.arrData)
                    self.tblApi.reloadData()
                }
                else
                {
                    print("Error")
                }
                break
            case .failure(_):
                print("Failure : \(response.result.error!)")
                break
            }
        }
    }

    @IBAction func btnActionPut(_ sender: Any) {
        
        let url = "https://reqres.in/api/login"
        
        //        print(url)
        
        let param = ["email": "peter@klaven",
                     "password": "cityslicka"]
        //        let header = ["content-type": "application/json","access-token": "12345678976649807"]
        let headers = ["Content-Type": "application/json"]
        print(param)
        
        Alamofire.request(url,method: .post, parameters: param, encoding: JSONEncoding.default, headers: nil).responseJSON { (response) in

            switch(response.result) {
            case .success(_):
                if response.result.value != nil
                {
                    let response = response.result.value! as! NSDictionary
                    print(response)
                }
                else
                {
                    print("Error")
                }
                break
            case .failure(_):
                print("Failure : \(response.result.error!)")
                break
            }
        
        }
        
    }
    @IBAction func btnActionBack(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    //        responseString { response in
    //                print("Success: \(response.result.isSuccess)")
    //                print("Response String: \(response.result.value)")
    //        }
    
}
