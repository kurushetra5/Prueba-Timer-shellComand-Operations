//
//  KUGenerator.swift
//  KUShellTask
//
//  Created by Kurushetra on 28/3/18.
//  Copyright © 2018 Kurushetra. All rights reserved.
//


import Foundation




public class KURandomGenerator {
    
    
    public static func string() -> String {
        return UUID().uuidString
    }
    
    public static func integer() -> Int {
        return Int(arc4random())
    }
    
    public static func integer2() -> Int {
        return Int(arc4random())
    }
    
    public static func stringsArray(amount:Int) -> [String] {
        
        var stringsArray:[String] = []
        
        while stringsArray.count < amount {
            
            let randomString = string()
            
            if !stringsArray.contains(randomString) {
                stringsArray.append(randomString)
            }
        }
        
        return stringsArray
    }
    
    
    
    public static func integersArray(amount:Int) -> [Int] {
        
        var intsArray:[Int] = []
        
        while intsArray.count < amount {
            
            let randomInt = integer()
            
            if !intsArray.contains(randomInt) {
                intsArray.append(randomInt)
            }
        }
        return intsArray
    }
    
}

