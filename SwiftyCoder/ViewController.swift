//
//  ViewController.swift
//  SwiftyCoder
//
//  Created by kukushi on 3/8/15.
//  Copyright (c) 2015 kukushi. All rights reserved.
//

import UIKit

struct cute {
    var string = "1"
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let data = NSKeyedArchiver.archivedDataWithRootObject(Tester())
        let tester = NSKeyedUnarchiver.unarchiveObjectWithData(data) as! Tester
        
        tester.cool()
        
//        let cute = cute()
//        let value = NSValue
        
        
//        NSUserDefaults.standardUserDefaults().setObject(Tester(), forKey: "tester")
//        let data = NSData(
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

