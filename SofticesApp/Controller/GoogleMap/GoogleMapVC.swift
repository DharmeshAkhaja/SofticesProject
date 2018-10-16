//
//  GoogleMapVC.swift
//  SofticesApp
//
//  Created by sa13 on 27/09/18.
//  Copyright © 2018 sa13. All rights reserved.
//

import UIKit
import GoogleMaps

class GoogleMapVC: UIViewController, GMSMapViewDelegate {

    @IBOutlet weak var mapContainer: GMSMapView!
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        // Do any additional setup after loading the view.
        let camera = GMSCameraPosition.camera(withLatitude: 21.1702, longitude: 72.8311, zoom: 16.0)
        mapContainer.camera = camera
        mapContainer.frame = self.mapContainer.bounds
        mapContainer.isMyLocationEnabled = true
        mapContainer.settings.myLocationButton = true
        mapContainer.mapType = .terrain
      //  mapContainer.padding = UIEdgeInsets(top: 0, left: 0, bottom: 50, right: 50)
        
        

        // Creates a marker in the center of the map.
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: 21.1702, longitude: 72.8311)
        marker.title = "Surat"
        marker.snippet = "India"
        marker.map = mapContainer
        
        
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    @IBAction func btnActionBack(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
        
    }
}
