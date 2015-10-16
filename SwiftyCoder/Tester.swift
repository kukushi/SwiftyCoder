//
//  Tester.swift
//  SwiftyCoder
//
//  Created by kukushi on 3/8/15.
//  Copyright (c) 2015 kukushi. All rights reserved.
//

import UIKit

class Tester: NSObject, NSCoding {
    var string = "123"
    var bool = true
    var rect = CGRectMake(1, 2, 3, 4)
    var int = 77
    
    override init () {
        super.init()
    }
    
    func cool() {
        let k = valueForKey("string") as! String
        
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder["string"] = string
        aCoder["bool"] = bool
        aCoder["rect"] = rect
        aCoder["int"] = int
    }
    
    required init?(coder aDecoder: NSCoder) {
        string = aDecoder["string"].string
        bool = aDecoder["bool"].bool
        rect = aDecoder["rect"].rect
        int = aDecoder["int"].int
    }
    
}
