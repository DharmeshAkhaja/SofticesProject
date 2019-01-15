//
//  NewContactVC.swift
//  SofticesApp
//
//  Created by sa13 on 31/12/18.
//  Copyright © 2018 sa13. All rights reserved.
//

import UIKit
import Contacts
import ContactsUI
import Photos

class NewContactVC: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    @IBOutlet weak var txtFirtsName: UITextField!
    @IBOutlet weak var txtLastName: UITextField!
     @IBOutlet weak var txtCompany: UITextField!
    @IBOutlet weak var txtphoneNo: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var btnAddPhoto: UIButton!
    
    var imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.imagePicker.delegate = self
        imagePicker.allowsEditing = true
        txtFirtsName.becomeFirstResponder()

        
    }
   
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
    
    // ADD CONTACT
    
    @IBAction func btnActionDone(_ sender: UIButton) {
        
        var isSuccessfullySaved : Bool = false
        let contactStore = CNContactStore()
        let contact = CNMutableContact()
        contact.givenName = txtFirtsName.text!
        contact.familyName = txtLastName.text!
        contact.organizationName = txtCompany.text!
        let phonenumber = CNPhoneNumber(stringValue: txtphoneNo.text!)
        let phone = CNLabeledValue(label: CNLabelHome, value: phonenumber)
        contact.phoneNumbers = [phone]
        
        let request = CNSaveRequest()
        request.add(contact, toContainerWithIdentifier: nil)
        do {
            try contactStore.execute(request)
            isSuccessfullySaved = true
        }
        catch{
            print("Error in Saved Contact")
        }
        if isSuccessfullySaved {
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    // ADD IMAGE
    
    @IBAction func btnActionAddPhoto(_ sender: UIButton) {
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated:true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        print(info)
        imageView.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func btnActionCancel(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}
