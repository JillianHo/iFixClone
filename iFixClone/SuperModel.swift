//
//  SuperModel.swift
//  iFixClone
//
//  Created by Cao Khac Le Duy on 11/21/15.
//  Copyright © 2015 Cao Khac Le Duy. All rights reserved.
//

import UIKit
import CoreData

class SuperModel: NSManagedObject {
    @NSManaged var id : String!
    
    
    override init(entity: NSEntityDescription, insertIntoManagedObjectContext context: NSManagedObjectContext?) {
        super.init(entity: entity, insertIntoManagedObjectContext: context)
    }
    
//    static func fetchCoreData(context : NSManagedObjectContext) -> [SuperModel]?{
//        let fetchIssueReq = NSFetchRequest.init(entityName: "Issue")
//        fetchIssueReq.returnsObjectsAsFaults = false;
//        do
//        {
//            let result = try context.executeFetchRequest(fetchIssueReq)
//            print(result.count)
//            print(result)
//            return (result as! [Issue])
//            
//        }catch{
//            return nil
//        }
//    }

    
    static func fetchData(issue:Issue?, context : NSManagedObjectContext) -> [SuperModel]?{
        let entityName = self.description().componentsSeparatedByString(".")[1]
        let fetchIssueReq = NSFetchRequest.init(entityName: entityName)
        if (issue != nil)
        {
            fetchIssueReq.predicate = NSPredicate.init(format: "issue == %@", issue!)
        }
        fetchIssueReq.returnsObjectsAsFaults = false;
        do
        {
            let result = try context.executeFetchRequest(fetchIssueReq)
            print(result.count)
            print(result)
            return (result as! [Offers])
            
        }catch{
            return nil
        }
    }

    
}
