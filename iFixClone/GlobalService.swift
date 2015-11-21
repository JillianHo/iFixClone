//
//  GlobalService.swift
//  iFixClone
//
//  Created by Cao Khac Le Duy on 10/22/15.
//  Copyright © 2015 Cao Khac Le Duy. All rights reserved.
//

import UIKit

class GlobalService: NSObject {
    static var httpService = HttpService()
    static var dataService = DataService()
    static var coredataService = CoreDataServices()

}
