//
//  Consumer.swift
//  iFixClone
//
//  Created by Cao Khac Le Duy on 10/23/15.
//  Copyright © 2015 Cao Khac Le Duy. All rights reserved.
//

import UIKit

class Consumer: NSObject {
    var longitude : Double!
    var latitude :Double!
    var name : String!
    
    init(rawObj: NSDictionary){
        self.longitude = rawObj["logitude"] as! Double
        self.latitude = rawObj["latitude"] as! Double
        self.name = rawObj["name"] as! String
    }
    
    init(longitude: Double, latitude: Double, name: String){
        self.longitude = longitude
        self.latitude = latitude
        self.name = name
    }
}
