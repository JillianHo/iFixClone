//
//  Device.swift
//  iFixClone
//
//  Created by Cao Khac Le Duy on 10/23/15.
//  Copyright © 2015 Cao Khac Le Duy. All rights reserved.
//

import UIKit
import CoreData

class Device: SuperModel {
    @NSManaged var imei : String!
    @NSManaged var serial : String!
    @NSManaged var platform : String!
    @NSManaged var manufacture : String!
    @NSManaged var model : String!
    @NSManaged var productionDate : String!
    @NSManaged var warrantyDate : String!

    override init(entity: NSEntityDescription, insertIntoManagedObjectContext context: NSManagedObjectContext?) {
        super.init(entity: entity, insertIntoManagedObjectContext: context)
    }
    
    init(rawObj: NSDictionary, context : NSManagedObjectContext){
        super.init(entity: NSEntityDescription.entityForName("Device", inManagedObjectContext: context)!, insertIntoManagedObjectContext: context)
        self.id = (rawObj["id"]?.description)!
        self.imei = rawObj["imei"] as! String
        self.serial = rawObj["serial"] as! String
        self.platform = rawObj["platform"] as! String
        self.manufacture = rawObj["manufacture"] as! String
        self.model = rawObj["model"] as! String
        self.productionDate = (rawObj["productionDate"]?.description)!
        self.warrantyDate = (rawObj["warrantyDate"]?.description)!
    }
}
