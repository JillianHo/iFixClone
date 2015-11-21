//
//  HttpService.swift
//  iFixClone
//
//  Created by Cao Khac Le Duy on 10/22/15.
//  Copyright © 2015 Cao Khac Le Duy. All rights reserved.
//

import UIKit

class HttpService: NSObject {
    func connect( url : String, handlerComplete: (content: NSData) ->()){
            NSURLConnection.sendAsynchronousRequest(
                NSURLRequest.init(URL: NSURL.init(string: url)!),
                queue: NSOperationQueue.mainQueue(),
                completionHandler: {
                    (response,data,error) -> Void in
                    handlerComplete(content: (data)!)
                    	
            })
        
//        let session = NSURLSession()
//        session.
//        session.dataTaskWithURL(NSURL.init(fileURLWithPath: url),
//            completionHandler: {
//                (data,response,error) -> Void in
//                handlerComplete(content: (data?.toNSDictionary())!)
//        })
    }
}
