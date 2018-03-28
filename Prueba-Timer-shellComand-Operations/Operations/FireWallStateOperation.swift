//
//  FireWallStateOperation.swift
//  Kuru_Threads-timers-Task
//
//  Created by Kurushetra on 1/3/18.
//  Copyright © 2018 Kurushetra. All rights reserved.
//

import Foundation



class FireWallStateOperation: TaskOperation,ComandRunerDelegate {
    
    func comand(finishWith data: String) {
        self.executing(false)
        self.finish(true)
    }
    
    func comand(type: String, finishWith: String) {
        self.executing(false)
        self.finish(true)
    }
    
    
    var responseData: String?
    public var comandRuner:ComandRuner = ComandRuner()
    
    
    override  init() {
        
    }
    
    
    override func main() {
        guard isCancelled == false else {
            finish(true)
            return
        }
        
        
        //        provider.restCall(urlString: urlString) { (data) in
         comandRuner.comandRunerDelegate = self
         comandRuner.runComand(type:"fireWallState", ip: nil)
        self.responseData = "FireWallStateOperation running"
        executing(true)
//        self.executing(false)
//        self.finish(true)
        //        }
    }
    
    
    
    
    
    
}
