//
//  AppDelegate.swift
//  SofticesApp
//
//  Created by sa13 on 27/09/18.
//  Copyright © 2018 sa13. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces
import GoogleSignIn
import FacebookLogin
import FacebookCore
import Firebase
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate{
    
    

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        GMSServices.provideAPIKey(APIKeys.GoogleMapKey)
        GMSPlacesClient.provideAPIKey(APIKeys.GoogleMapKey)
        GIDSignIn.sharedInstance().clientID = "997324838420-cobd7eq8bsd9sj624f9nou4t840u7mut.apps.googleusercontent.com"
        FirebaseApp.configure()
        
        return true
    }
    
//    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
//    
//    }
    
    
    func applicationWillResignActive(_ application: UIApplication) {
       
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
     
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
       
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
     
    }

    func applicationWillTerminate(_ application: UIApplication) {
    }


}

