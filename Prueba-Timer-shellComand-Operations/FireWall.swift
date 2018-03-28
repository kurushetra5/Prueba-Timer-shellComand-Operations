//
//  FireWall.swift
//  FireWarWall
//
//  Created by Kurushetra on 7/2/18.
//  Copyright © 2018 Kurushetra. All rights reserved.
//

import Foundation




//MARK: --------  Prorocol Delegate  ---------------
protocol FireWallDelegate {
//    func fireWallEstablished(conections:[ConectionNode])
//    func fireWallEstablished(ips:[NetStatConection])
//    func fireWallBlocked(ips:[NetStatConection])
//    func fireWall(state:Bool)
//    func fireWallDidUnblockIp()
//    func fireWallDidBlockIp()
//    func fireWallDidStart()
//    func fireWallDidStop()
    func finish(data:[String], type:ComandType)
    
}






//MARK: --------  Class  FireWall  ---------------
class FireWall  {
    
    var timer:Timer!
    var timer2:Timer!
    var fireWallDelegate:FireWallDelegate!
    
   init() {
 
      print("init()FireWall ")
    }
    
    
    

    func runComand(type:Comand, completion:@escaping ([String],ComandType) -> Void) {
        
        let task = Process()
        task.launchPath = type.taskPath
        task.arguments = type.taskArgs
        task.standardOutput = Pipe()
        
        task.terminationHandler = { task in
            guard task.terminationStatus == 0
                else {
                    NSLog("The process fail to operate.")
                    return
            }
            
            guard let data = (task.standardOutput as? Pipe)?.fileHandleForReading.availableData,
                data.count > 0,
                let s = String(data: data, encoding: .utf8)
                else { return }
            
            let dataResult = s.components(separatedBy: "\n").filter{ !$0.contains("/.git/") }
            
            DispatchQueue.main.sync {
                completion(dataResult,type.type)
            }
        }
        task.launch()
    }
    
    
    
    
    
   
    
   
    
    
    
    //MARK: --------  Public Funcs  ---------------
    
    public  func runcomand1(comand:Comand) {
        
        
        print("runcomand 1")
        runComand(type:NsLookup(withIp:"80.33.22.2")) { (results, type) in
//            print(results)
//            print(type)
            self.fireWallDelegate?.finish(data: results, type: type)
        }
 
    }
    
   public func runcomand2(comand:Comand) {
        
        print("runcomand 2")
 
    }
    
    
    
    public func  comand1(comand:Comand) {
        
        print("comand 1")
 
    }
    
    
    public func  comand2(comand:Comand) {
        
        print("comand 2")
 
    }
    
    
    
    public   func normalTimer()  {
        
        print("Normal Timer")
        
       
        
        timerStart()
         timerStart2()
 
 
    }
    
    
    
 
    
    
    
   
  
    
   
    
    
    
    
    
    
    
    
   
    
    
    func timerStart2() {
        
        timer2 = Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(self.timerAction2), userInfo: nil, repeats: true)
        print("timerStart2()")
        
    }
    
    func timerStart() {
        
        timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(self.timerAction), userInfo: nil, repeats: true)
       print("timerStart()")
        
    }
    
    
    
    
    
  
    
    @objc func timerAction() {
     print("timer Action()")
        
        runComand(type:NetStat()) { (results, type) in
//            print(results)
//            print(type)
            self.fireWallDelegate?.finish(data: results, type: type)
        }
        
        
  
    }
    
    
    
    @objc func timerAction2() {
        print("timer Action2()")
 
        runComand(type:FireWallState()) { (results, type) in
//            print(results)
//            print(type)
            self.fireWallDelegate?.finish(data: results, type: type)
        }
        
  
    }
    
    
    
   
    
    
    
   
 
    func runTask1() {
        
  
    }
    
    
    func runTask2() {
        
 
    }
    
    
    
    func runTask3() {
        for _ in 0..<1000 {
            print("runTask 3")
        }
    }
    
    func runTask4() {
        for _ in 0..<1000 {
            print("runTask 4")
        }
    }
    
    
}






