//
//  ViewController.swift
//  SofticesApp
//
//  Created by sa13 on 27/09/18.
//  Copyright © 2018 sa13. All rights reserved.
//

import UIKit
import SideMenu

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSidemenu()
        
        
    }
   
    func setupSidemenu(){
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "UISideMenuNavigationController") as! UISideMenuNavigationController
        SideMenuManager.default.menuLeftNavigationController = vc
        SideMenuManager.default.menuPresentMode = .menuSlideIn
        SideMenuManager.default.menuWidth = self.view.frame.width * 0.75
        SideMenuManager.default.menuAnimationPresentDuration = 0.5
        SideMenuManager.default.menuAddPanGestureToPresent(toView: self.navigationController!.view)
        SideMenuManager.default.menuAddScreenEdgePanGesturesToPresent(toView: self.navigationController!.view)
        
    }
    
    @IBAction func btnActionSideMenu(_ sender: Any) {
        present(SideMenuManager.default.menuLeftNavigationController!, animated: true, completion: nil)
        
    }

}


