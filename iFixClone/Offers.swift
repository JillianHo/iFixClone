//
//  Offers.swift
//  iFixClone
//
//  Created by Cao Khac Le Duy on 10/23/15.
//  Copyright © 2015 Cao Khac Le Duy. All rights reserved.
//

import UIKit
import CoreData

class Offers: Provider {
    @NSManaged var totalPrice : NSNumber
    @NSManaged var currency : String!
    @NSManaged var issue: Issue!
//    override init(id: Int, name: String, logo: String, votedStars: Int, phone: String?) {
//        super.init(id: id, name: name, logo: logo, votedStars: votedStars, phone: phone)
//    }
    
    override init(entity: NSEntityDescription, insertIntoManagedObjectContext context: NSManagedObjectContext?) {
        super.init(entity: entity, insertIntoManagedObjectContext: context)
    }
    
    init(rawObj: NSDictionary?, context :NSManagedObjectContext,issue: Issue) {
        super.init(rawObj: rawObj, context: context)
        self.totalPrice = rawObj?["totalPrice"] as! NSNumber
        self.currency = rawObj?["currency"] as? String
        self.issue = issue
    }
//    
//    func setOffer( totalPrice : Int32?, currency : String?){
//        self.totalPrice = totalPrice!
//        self.currency = currency
//    }
    
//    func setIssueProperty(issue: Issue){
//        self.issue = issue
//    }
    }
