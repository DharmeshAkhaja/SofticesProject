//
//  UIElementVC.swift
//  SofticesApp
//
//  Created by sa13 on 23/10/18.
//  Copyright © 2018 sa13. All rights reserved.
//

import UIKit

class UIElementVC: UIViewController {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var btnOutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btnOutlet.setImage(UIImage(named: "heartRed"), for: .normal)
        
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func stepperValueChanged(_ sender: Any) {
        
        lblTitle.text = String(stepper.value)
    }
    
    @IBAction func valueChangeSlider(_ sender: Any) {
        lblTitle.text = String(format: "%.2f", slider.value)
        progressView.progress = slider.value/100
        
        
    }
    
    @IBAction func btnAction(_ sender: Any) {
        
        btnOutlet.isSelected = !btnOutlet.isSelected
    }
    
    @IBAction func btnActionBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func btnActionNextPage(_ sender: UIButton) {
        
        let storyboard = UIStoryboard(name: "UIElement", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "TableRow") as! TableRow
        self.present(vc, animated: true, completion: nil)
    }
    
    
}
