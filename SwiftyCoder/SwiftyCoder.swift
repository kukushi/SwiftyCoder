//
//  SwiftyCoder.swift
//  SwiftyCoder
//
//  Created by kukushi on 3/8/15.
//  Copyright (c) 2015 kukushi. All rights reserved.
//

import Foundation
import CoreGraphics
import CoreFoundation

extension NSCoder {
    class Proxy {
        private var coder: NSCoder!
        private var key: String!
        
        init(_ coder: NSCoder, _ key: String) {
            self.coder = coder
            self.key = key
        }
        
        var object: AnyObject? {
            return self[key]
        }
        
        subscript(key: String) -> AnyObject? {
            return coder.decodeObjectForKey(key)
        }
        
        var string: String {
            return (object as? String) ?? ""
        }
        
        var data: NSData {
            return (object as? NSData) ?? NSData()
        }
        
        var number: NSNumber? {
            return object as? NSNumber
        }
        
        var value: NSValue? {
            return object as? NSValue
        }
        
        var bool: Bool {
            return coder.decodeBoolForKey(key) ?? false
        }
        
        var double: Double {
            return number?.doubleValue ?? 0
        }
        
        var float: Float {
            return number?.floatValue ?? 0
        }
        
        var int: Int {
            return coder.decodeIntegerForKey(key) ?? 0
        }
        
        var rect: CGRect {
            return value?.CGRectValue() ?? CGRectZero
        }
        
        var URL: NSURL? {
            return NSURL(string: string)
        }
        
        var date: NSDate? {
            return object as? NSDate
        }
    }
    
    // TODO: How it work?
    
    subscript(key: String) -> Proxy {
        return Proxy(self, key)
    }
    
    subscript(key: String) -> Any? {
        get {
            return self[key]
        }
        
        set {
            if let string = newValue as? String {
                encodeObject(string, forKey: key)
            }
            else if let bool = newValue as? Bool {
                encodeBool(bool, forKey: key)
            }
            else if let rect = newValue as? CGRect {
                encodeObject(NSValue(CGRect: rect), forKey: key)
            }
            else if let int = newValue as? Int {
                encodeInteger(int, forKey: key)
            }
            else if let URL = newValue as? NSURL {
                encodeObject(URL.absoluteString, forKey: key)
            }
            else if let date = newValue as? NSDate {
                encodeObject(date, forKey: key)
            }
            else if let object: AnyObject = newValue as? AnyObject {
                encodeObject(object, forKey: key)
            }
        }
    }
}