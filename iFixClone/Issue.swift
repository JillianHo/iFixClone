//
//  Issue.swift
//  iFixClone
//
//  Created by Cao Khac Le Duy on 10/23/15.
//  Copyright © 2015 Cao Khac Le Duy. All rights reserved.
//

import UIKit
import CoreData

class Issue: SuperModel {
    @NSManaged var type : 	NSNumber
    @NSManaged var status : NSNumber
    @NSManaged var timeCreated : String
    @NSManaged var isNotifyEmail : Bool
    @NSManaged var isTravelToConsumer : Bool
    @NSManaged var device : Device!
    //@NSManaged var consumer : Consumer?
    @NSManaged var providers : NSSet
    @NSManaged var descript : String
    @NSManaged var issues : [String]!
    @NSManaged var serviceId: NSNumber
    @NSManaged var previewImgUrl : [String]!
    
    
    
    override init(entity: NSEntityDescription, insertIntoManagedObjectContext context: NSManagedObjectContext?) {
        super.init(entity: entity, insertIntoManagedObjectContext: context)
    }
    
    init (rawObj: NSDictionary,context: NSManagedObjectContext){
        super.init(entity: NSEntityDescription.entityForName("Issue", inManagedObjectContext: context)!, insertIntoManagedObjectContext: context)
        var offers = [Offers]()
        if let arr = rawObj["providers"] as? NSArray
        {
            for i in 0...arr.count-1{
                if let offer = arr[i] as? NSDictionary {
                    let offerCon = Offers(rawObj: offer, context: context, issue: self)
                    offers.append(offerCon)
                }
            }
        }
        print(rawObj["id"]?.description)
        self.id = (rawObj["id"]?.description)!
        self.type = rawObj["type"] as! Int
        
        self.status = rawObj["type"] as! Int
        self.timeCreated = (rawObj["timeCreated"]?.description)!
        self.isNotifyEmail = rawObj["isNotifyEmail"] as! Bool
        if let device = rawObj["device"] as? NSDictionary{
            self.device = Device(rawObj: (device),context: context)
        }
//        if let consumer = rawObj["consumer"] as? NSDictionary {
//            self.consumer = Consumer(rawObj: consumer)
//        }
        
        self.providers = NSSet.init(array: offers)
        
        
        self.descript = (rawObj["desription"]?.description)!
        self.issues = rawObj["issues"] as! [String]
        self.serviceId = rawObj["serviceId"] as! Int
        self.isTravelToConsumer = rawObj["isTravelToConsumer"] as! Bool
        self.previewImgUrl = rawObj["previewImages"] as! [String]
    }
    
    func getServiceType () -> String {
        switch (self.type){
        case 1:
            return "Repair Service"
        case 2:
            return "Maintainance"
        default:
            return "Unknown"
        }
    }
    
    func getStatusConvert() -> String{
        switch (self.status){
        case 1:
            return "New"
        case 2:
            return "Da Thue"
        case 3:
            return "Da Bao Gia"
        default:
            return "Unknown"
        }
    }
    
    func getDay(date : NSDate) -> String{
        let today = NSDate()
        let calendar = NSCalendar.currentCalendar()
        let component_today = calendar.components(NSCalendarUnit.Day.union(NSCalendarUnit.Month.union(NSCalendarUnit.Weekday).union(NSCalendarUnit.Year)), fromDate: today)
        let component_date = calendar.components(NSCalendarUnit.Day.union(NSCalendarUnit.Month.union(NSCalendarUnit.Weekday).union(NSCalendarUnit.Year)), fromDate: date)
        let todayd = component_today.day
        let thismonth = component_today.month
        let thatday = component_date.day
        let thatmonth = component_date.month
        var stringDay = ""
        if (thismonth == thatmonth) {
            if (todayd == thatday)
            {
                stringDay = "Today"
            }else if todayd == thatday + 1 {
                stringDay = "Yesterday"
            }else {
                stringDay = self.getWeekDay(component_date.weekday)
            }
        }else{
            stringDay = thatday.description + "/" + thatmonth.description + "/" + component_date.year.description
        }
        return stringDay
    }
    
    func getTime(date : NSDate) -> String{
        print(date.description)
        let calendar = NSCalendar.currentCalendar()
        calendar.timeZone = NSTimeZone(forSecondsFromGMT: 7)
        let components = calendar.components(NSCalendarUnit.Hour.union(NSCalendarUnit.Minute), fromDate: date)
        return components.hour.description  + ":" + components.minute.description
    }
    
    func getWeekDay(day: Int) -> String{
        switch day {
        case 0:
            return "Monday"
        case 1:
            return "Tuesday"
        case 2:
            return "Wednesday"
        case 3:
            return "Thursday"
        case 4:
            return "Friday"
        case 5:
            return "Saturday"
        default:
            return "Sunday"
        }
    }
    
    }
