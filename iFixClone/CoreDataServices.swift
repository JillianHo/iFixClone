//
//  CoreDataServices.swift
//  iFixClone
//
//  Created by Cao Khac Le Duy on 11/7/15.
//  Copyright © 2015 Cao Khac Le Duy. All rights reserved.
//

import UIKit
import CoreData

class CoreDataServices: NSObject {
    var coreDataManagedObjectContext : NSManagedObjectContext!
    
    override init(){
        super.init()
    }
    
    func setManagedObjectContext(coremanagedcontext : NSManagedObjectContext)
    {
        self.coreDataManagedObjectContext = coremanagedcontext
    }
    
    func save(){
        do {
            try self.coreDataManagedObjectContext.save()
        }catch{
            
        }
    }
    
}
