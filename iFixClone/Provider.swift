//
//  Provider.swift
//  iFixClone
//
//  Created by Cao Khac Le Duy on 10/23/15.
//  Copyright © 2015 Cao Khac Le Duy. All rights reserved.
//

import UIKit
import CoreData

class Provider: SuperModel {
    @NSManaged var name : String!
    @NSManaged var logo : String!
    @NSManaged var votedStars : NSNumber
    @NSManaged var phone : String?
    
//    init(id: Int, name:String,logo:String,votedStars:Int,phone:String?) {
//        super.init()
//        self.id = id
//        self.name = name
//        self.logo = logo
//        self.votedStars = votedStars
//        self.phone = phone
//    }
//    
//    init(rawObj: NSDictionary?, context: NSManagedObjectContext){
//        super.init(entity: NSEntityDescription.entityForName("Provider", inManagedObjectContext: context)!, insertIntoManagedObjectContext: context)
//        print(rawObj?["totalPrice"]?.description)
//        self.id = rawObj?["id"] as! NSNumber
//        self.name = rawObj?["name"] as! String
//        self.logo = rawObj?["logo"] as! String
//        self.votedStars = rawObj?["votedStars"] as! NSNumber
//        self.phone = rawObj?["phone"] as? String
//    }
//    
    
    override init(entity: NSEntityDescription, insertIntoManagedObjectContext context: NSManagedObjectContext?) {
        super.init(entity: entity, insertIntoManagedObjectContext: context)
    }
    
    init(rawObj: NSDictionary?, context: NSManagedObjectContext){
        super.init(entity: NSEntityDescription.entityForName("Offers", inManagedObjectContext: context)!, insertIntoManagedObjectContext: context)
        print(rawObj?["totalPrice"]?.description)
        self.id = rawObj?["id"]?.description
        self.name = rawObj?["name"] as! String
        self.logo = rawObj?["logo"] as! String
        self.votedStars = rawObj?["votedStars"] as! NSNumber
        self.phone = rawObj?["phone"] as? String
    }
}
