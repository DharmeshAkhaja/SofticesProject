//
//  FatchContact.swift
//  SofticesApp
//
//  Created by sa13 on 21/12/18.
//  Copyright © 2018 sa13. All rights reserved.
//

import UIKit
import Contacts
import ContactsUI

class FatchContact: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    
    @IBOutlet weak var tblFatchContact: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    let keys = [CNContactPhoneNumbersKey, CNContactFamilyNameKey, CNContactGivenNameKey, CNContactNoteKey, CNContactDatesKey, CNContactImageDataKey, CNContactEmailAddressesKey]
    
    let contactStore = CNContactStore()
    var contacts = [CNContact]()
    var isSuccessfullyDeleted = false
    var inSearchMode = false
    let store = CNContactStore()
    var filteredData = [CNContact]()
    
    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        
        tblFatchContact.delegate = self
        tblFatchContact.dataSource = self
        searchBar.delegate = self
        searchBar.returnKeyType = UIReturnKeyType.done
        tblFatchContact.tableFooterView = UIView()
        tblFatchContact.separatorStyle = .none
        tblFatchContact.rowHeight = 75
        
        fetchContact()
        tblFatchContact.reloadData()
    
    }
   
    @IBAction func btnActionAddContact(_ sender: UIButton) {
        
        let storyBoard = UIStoryboard(name: "UIElement", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "NewContactVC") as! NewContactVC
        self.present(vc, animated: true, completion: nil)
    }
    
    
    @IBAction func btnActionRemove(_ sender: UIButton) {
        
        contacts.remove(at: sender.tag)
        tblFatchContact.reloadSections(IndexSet(integer: 0), with: .automatic)
    }
    
    // DELETE CONTACT
    func deleteContacts(contact: CNContact) {
        
        do {
            
            let contacts = try store.unifiedContacts(matching: CNContact.predicateForContacts(withIdentifiers: [contact.identifier] as! [String]), keysToFetch: keys as [CNKeyDescriptor])
            print(contacts)
            for contact in contacts {
                let request = CNSaveRequest()
                let mutableContact = contact.mutableCopy() as! CNMutableContact
                request.delete(mutableContact)
                do {
                    try store.execute(request)
                    fetchContact ()
                    isSuccessfullyDeleted = true
                } catch let e{
                    print("Error = \(e)")
                }
                
            }
        } catch {
        }
        if isSuccessfullyDeleted{
            tblFatchContact.reloadData()
            isSuccessfullyDeleted = true
        }
        
    }
    
    //SEARCH CONTACT
    func searchBar(_ searchBar: UISearchBar , textDidChange searchText: String){
        filteredData.removeAll()
        if searchText == "" {
            inSearchMode = false
        } else {
             inSearchMode = true
            filteredData = contacts.filter({(contact) -> Bool in
                contact.givenName.lowercased().contains(searchText.lowercased()) ||
                    contact.familyName.lowercased().contains(searchText.lowercased())
            })
            tblFatchContact.reloadData()
        }
    }

    // FATCH CONTACT
    
    func fetchContact() {
//        contacts.removeAll()
//
//        let request = CNContactFetchRequest(keysToFetch: keys as [CNKeyDescriptor])
//
//        request.sortOrder = .givenName
//
//        do {
//            try self.contactStore.enumerateContacts(with: request) {
//                (contact, stop) in
//                // Array containing all unified contacts from everywhere
//                self.contacts.append(contact)
//            }
//        }
//        catch {
//            print("unable to fetch contacts")
//        }
//        tblFatchContact.reloadData()
//    }
        contacts.removeAll()
        
        let contactStore = CNContactStore()
        var conteners =  [CNContainer]()
        
        do{
            conteners = try contactStore.containers(matching: nil)
        }
        catch{
            print("error in  container macting")
        }
        
        
        for container_count in conteners{
            
            print(container_count.identifier)
            let fetchPredict = CNContact.predicateForContactsInContainer(withIdentifier: container_count.identifier)
            print(fetchPredict)
            do{
                let contact_result = try contactStore.unifiedContacts(matching: fetchPredict, keysToFetch: keys as [CNKeyDescriptor])
                contacts.append(contentsOf: contact_result)
                
                print(contact_result)
            }catch{
                print("error  in contact facthing")
            }
            
        }
        tblFatchContact.reloadData()
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        if inSearchMode{
            return filteredData.count
        }
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblFatchContact.dequeueReusableCell(withIdentifier: "FatchTableCell") as! FatchTableCell
        
        var contact = self.contacts[indexPath.row]
        if inSearchMode {
            contact = self.filteredData[indexPath.row]
        }else{
            contact = self.contacts[indexPath.row]
        }
        
        cell.lblName.text = contact.givenName + " " + contact.familyName
        
        if !contact.phoneNumbers.isEmpty {
            cell.lblMobileNo.text = contact.phoneNumbers.first?.value.stringValue
        } else {
            cell.lblMobileNo.text = "No Number"
        }
        
        
        cell.btnRemove.tag = indexPath.row
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
        
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            let data = contacts[indexPath.row]
            deleteContacts(contact: data)
        }
    }
    
    
    @IBAction func btnActionBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
