//
//  StudentListVC.swift
//  SofticesApp
//
//  Created by sa13 on 25/10/18.
//  Copyright © 2018 sa13. All rights reserved.
//

import UIKit
import RealmSwift

class StudentListVC: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var realm: Realm!
    var arrData: Results<Student> {
        get {
            return realm.objects(Student.self)
        }
    }
    @IBOutlet weak var tblStudentList: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        realm = try! Realm()
        
        tblStudentList.dataSource = self
        tblStudentList.delegate = self
        tblStudentList.separatorStyle = .none
        tblStudentList.tableFooterView = UIView()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblStudentList.dequeueReusableCell(withIdentifier: "StudentListCell") as! StudentListCell
        let data = arrData[indexPath.row]
        cell.lblTitle.text = data.First_Name + " " + data.Last_Name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let data = arrData[indexPath.row]
        let storyboard = UIStoryboard(name: "API", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "StudentDetailVC") as! StudentDetailVC
        vc.data = data
        self.present(vc, animated: true, completion: nil)
        
    }
    

    @IBAction func btnActionBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
        
    }
}
