//
//  NSData + Extension.swift
//  iFixClone
//
//  Created by Cao Khac Le Duy on 10/22/15.
//  Copyright © 2015 Cao Khac Le Duy. All rights reserved.
//

import UIKit

extension NSData {
    func toNSDictionary() -> NSDictionary? {
        do{
            let jsonobj = try NSJSONSerialization.JSONObjectWithData(self, options: NSJSONReadingOptions.init(rawValue: 0))
            return jsonobj as? NSDictionary
        }catch
        {
            return nil
        }
    }
}
