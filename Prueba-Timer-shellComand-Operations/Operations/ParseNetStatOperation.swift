//
//  ParseNetStatOperation.swift
//  Kuru_Threads-timers-Task
//
//  Created by Kurushetra on 1/3/18.
//  Copyright © 2018 Kurushetra. All rights reserved.
//

import Foundation


class ParseNetStatOperation: TaskOperation {
    
    var responseData: String?
    public var comandRuner:ComandRuner = ComandRuner()
    
    override init() {
        
    }
    
    override func main() {
        guard isCancelled == false else {
            finish(true)
            return
        }
        
        executing(true)
        //        provider.restCall(urlString: urlString) { (data) in
                     self.responseData =  "NetStatOperation runing"
        
//        comandRuner.runComand(type:"netStat", ip: nil)
        
        
                  self.executing(false)
                   self.finish(true)
        //        }
    }
}
