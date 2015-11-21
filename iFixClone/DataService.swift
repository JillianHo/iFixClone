//
//  DataService.swift
//  iFixClone
//
//  Created by Cao Khac Le Duy on 10/22/15.
//  Copyright © 2015 Cao Khac Le Duy. All rights reserved.
//

import UIKit

class DataService: NSObject {
    var issues : [Issue]!
    func ParseJSonListIssues(url : String!, hanlder:(content: NSDictionary)->()){
        if (url as NSString).length == 0  {return }
        let httpservice =  GlobalService.httpService
        httpservice.connect(url, handlerComplete: {
                        (content) -> Void in
            let content2 = content.toNSDictionary()
            let arrayDic = content2!["list"] as! NSArray
            if (arrayDic.count == 0) {return}
            
            self.issues = [Issue]()
            
            for dic in arrayDic {
                if let issue = dic as? NSDictionary {
                    let tmp = Issue(rawObj: issue,context: GlobalService.coredataService.coreDataManagedObjectContext)
                    
                    GlobalService.coredataService.save()
                    
                    self.issues.append(tmp)
                }
            }
            hanlder(content: content2!)

            })
    }
    
//    func ToDevice(rawObj : NSDictionary?) -> Device?{
//        let de = Device(
//            id: (rawObj?["id"]?.description)!,
//            imei: rawObj?["imei"] as! String,
//            serial: rawObj?["serial"] as! String,
//            platform: rawObj?["platform"] as! String,
//            maufature: rawObj?["manufacture"] as! String,
//            model: rawObj?["model"] as! String,
//            productionDate: (rawObj?["productionDate"]?.description)!,
//            warrantyDate: (rawObj?["warrantyDate"]?.description)!)
//        return de
//    }
//    
//    func ToConsumer (rawObj: NSDictionary?) -> Consumer?{
//        if rawObj == nil {return nil}
//        let con = Consumer(longitude: rawObj?["logitude"] as! Double, latitude: rawObj?["latitude"] as! Double, name: rawObj?["name"] as! String)
//        return con
//    }
//    
//    
//    func ToOffer (rawObj : NSDictionary? ) -> Offers?{
//        print(rawObj?["totalPrice"]?.description)
//        let offer = Offers(
//            id: rawObj?["id"] as! Int,
//            name: rawObj?["name"] as! String,
//            logo: rawObj?["logo"] as! String,
//            votedStars: rawObj?["votedStars"] as! Int,
//            phone: (rawObj?["phone"] as? String))
//        offer.setOffer(Int32((rawObj?["totalPrice"]?.description)!), payperMonth: Int32((rawObj?["payPerMonth"]?.description)!), numMonths: rawObj?["numMonths"] as? Int, currency: rawObj?["currency"] as? String)
//        return offer
//    }
//    
//    func ToIssue( rawObj : NSDictionary) -> Issue?{
//        var offers = [Offers]()
//        if let arr = rawObj["providers"] as? NSArray
//        {
//            for i in 0...arr.count-1{
//                offers.append(self.ToOffer(arr[i] as? NSDictionary)!)
//            }
//        }
//        let isu = Issue(
//            id: (rawObj["id"]?.description)!,
//            type: rawObj["type"] as! Int,
//            status: rawObj["type"] as! Int,
//            timeCreated: (rawObj["timeCreated"]?.description)!,
//            isNotifyEmai: rawObj["isNotifyEmail"] as! Bool,
//            device: self.ToDevice(rawObj["device"] as? NSDictionary)!,
//            consumer: self.ToConsumer(rawObj["consumer"] as? NSDictionary),
//            offers: offers,
//            descript: (rawObj["desription"]?.description)!,
//            issues: rawObj["issues"] as! [String],
//            serviceId: rawObj["serviceId"] as! Int,
//            isTravel: rawObj["isTravelToConsumer"] as! Bool,
//            img: rawObj["previewImages"] as! [String])
//        print(isu)
//        return isu
//    }
}
