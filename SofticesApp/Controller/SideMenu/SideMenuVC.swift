//
//  SideMenuVC.swift
//  SofticesApp
//
//  Created by sa13 on 05/10/18.
//  Copyright © 2018 sa13. All rights reserved.
//

import UIKit
import SideMenu

class SideMenuVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var arrData = ["Map","API","FaceBook","Share","ShareIMG","GoogleLogin","ConvertValue"]
    var arrImage = [#imageLiteral(resourceName: "GOOGLE MAP"),#imageLiteral(resourceName: "api-prosyscom-tech"),#imageLiteral(resourceName: "Facebook 2"),#imageLiteral(resourceName: "ShareButtonRoundBlue"),#imageLiteral(resourceName: "ShareButtonRoundBlue"),#imageLiteral(resourceName: "google-logo"),#imageLiteral(resourceName: "convert")]
    
    @IBOutlet weak var tblSideMenu: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tblSideMenu.dataSource = self
        tblSideMenu.delegate = self
        tblSideMenu.tableFooterView = UIView()
        tblSideMenu.separatorStyle = .none
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblSideMenu.dequeueReusableCell(withIdentifier: "SideMenuCell") as! SideMenuCell
        cell.lblTitle.text = arrData[indexPath.row]
        cell.imgView.image = arrImage[indexPath.row]
        cell.selectionStyle = .none
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        switch indexPath.row {
        case 0:
            let story = UIStoryboard(name: "GoogleMap", bundle: nil)
            let vc = story.instantiateViewController(withIdentifier: "GoogleMapVC") as! GoogleMapVC
            self.present(vc, animated: true, completion: nil)
        case 1:
            let story = UIStoryboard(name: "API", bundle: nil)
            let vc = story.instantiateViewController(withIdentifier: "ApiVC") as! ApiVC
            self.present(vc, animated: true, completion: nil)
        case 2:
            print("FaceBook")
        case 3:
            // text to share
            let text = "This is some text that I want to share."
            
            // set up activity view controller
            let textToShare = [ text ]
            let activityViewController = UIActivityViewController(activityItems: textToShare, applicationActivities: nil)
            activityViewController.popoverPresentationController?.sourceView = self.view // so that iPads won't crash
            
            // exclude some activity types from the list (optional)
            activityViewController.excludedActivityTypes = [ UIActivityType.airDrop, UIActivityType.postToFacebook ]
            
            // present the view controller
            self.present(activityViewController, animated: true, completion: nil)
        case 4:
            let image = UIImage(named: "logout")
            let activityViewController = UIActivityViewController(activityItems: [image], applicationActivities: nil)
            activityViewController.popoverPresentationController?.sourceView = self.view
            activityViewController.excludedActivityTypes = [ UIActivityType.airDrop, UIActivityType.postToFacebook ]
            
            self.present(activityViewController, animated: true, completion: nil)
        case 5:
            let storyboard = UIStoryboard(name: "GoogleMap", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "GoogleSignInVC") as! GoogleSignInVC
            self.present(vc, animated: true, completion: nil)
        case 6:
            let storyboard = UIStoryboard(name: "ConvertValue", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "ConvertValueVC") as! ConvertValueVC
            self.present(vc, animated: true, completion: nil)
            
            
            
            
        default:
            print("byee")
        }
        
    }
    
}

