//
//  Code.swift
//  DataManager
//
//  Created by Noirozr on 15/6/12.
//  Copyright (c) 2015年 Yongjia Liu. All rights reserved.
//

import UIKit
import CoreData
let x : Int = 2
@objc(Code)
class Code: NSManagedObject {
    @NSManaged var content: String?
    @NSManaged var year: String?
    @NSManaged var month: String?
    @NSManaged var day: String?
}
