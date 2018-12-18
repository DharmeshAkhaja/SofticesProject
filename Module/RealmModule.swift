//
//  RealmModule.swift
//  SofticesApp
//
//  Created by sa13 on 25/10/18.
//  Copyright © 2018 sa13. All rights reserved.
//

import Foundation
import RealmSwift

class Student: Object
{
    @objc dynamic var First_Name = String()
    @objc dynamic var Last_Name = String()
    @objc dynamic var Email = String()
    @objc dynamic var Phone = String()
    @objc dynamic var Branch = String()
}


