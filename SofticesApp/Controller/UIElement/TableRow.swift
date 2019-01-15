//
//  TableRow.swift
//  SofticesApp
//
//  Created by sa13 on 20/12/18.
//  Copyright © 2018 sa13. All rights reserved.
//

import UIKit

class TableRow: UIViewController,UITextFieldDelegate, UITableViewDataSource,UITableViewDelegate {
    
    

    var ArrData = ["1","2","3","4","5"]
    
    @IBOutlet weak var txtAddRow: UITextField!
    @IBOutlet weak var tableAddRemove: UITableView!
    
    override func viewDidLoad() {
        
        tableAddRemove.dataSource = self
        tableAddRemove.delegate = self
        tableAddRemove.tableFooterView = UIView()
        tableAddRemove.separatorStyle = .none
        super.viewDidLoad()

    }

    @IBAction func btnAddRow(_ sender: UIButton) {
        
        AddNewRow()
    }
    
    func AddNewRow (){
        ArrData.append(txtAddRow.text!)
        let indexpath = IndexPath(row: ArrData.count - 1, section: 0)
        tableAddRemove.insertRows(at: [indexpath], with: .automatic)
        tableAddRemove.reloadRows(at: [indexpath], with: .automatic)
        txtAddRow.text = ""
        view.endEditing(true)
        
    }

    @IBAction func RemoveRow(_ sender: UIButton) {
        ArrData.remove(at: sender.tag)
        tableAddRemove.reloadSections(IndexSet(integer: 0), with: .automatic)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ArrData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableAddRemove.dequeueReusableCell(withIdentifier: "TableVCCell") as! TableVCCell
        cell.lblTitle.text = ArrData[indexPath.row]
        cell.btnRemove.tag = indexPath.row
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            ArrData.remove(at: indexPath.row)
            tableView.beginUpdates()
            tableView.deleteRows(at: [indexPath], with: .automatic)
            tableView.endUpdates()
        }
    }

    @IBAction func BtnActionFatchContact(_ sender: UIButton) {
        
        let storyboard = UIStoryboard(name: "UIElement", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "FatchContact") as! FatchContact
        self.present(vc, animated: true, completion: nil)
        
    }
    
    @IBAction func btnActionBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}


