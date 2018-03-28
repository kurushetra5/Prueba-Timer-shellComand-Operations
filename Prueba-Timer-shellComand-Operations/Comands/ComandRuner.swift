//
//  ComandRuner.swift
//  Prueba-Timer-shellComand-Operations
//
//  Created by Kurushetra on 22/3/18.
//  Copyright © 2018 Kurushetra. All rights reserved.
//

import Foundation



protocol ComandsRunerDelegate {
    func finish(comand:ComandType, withResult result:[String])
}




class ComandsRuner {
    
    
    var timer:Timer!
    var timer2:Timer!
    
    
    var comandsRunerDelegate:ComandsRunerDelegate!
    var comand1:Comand!
    var comand2:Comand!
    
    
    
    public func run(comand:Comand, forEver:Bool) {
        
        switch forEver {
        case true:
            
            if timer  == nil {
                comand1 = comand
                timerStart()
            }else if timer != nil {
                comand2 = comand
                timerStart2()
            }
            
        case false:
            run(comand: comand, completion: { (results,comand) in
                print(results)
                print(comand)
                self.comandsRunerDelegate?.finish(comand:comand, withResult:results)
            })
            
        }
        
    }
    
    
    
    
    
    
    private func run(comand:Comand, completion:@escaping ([String],ComandType) -> Void) {
        
        let task = Process()
        task.launchPath = comand.taskPath
        task.arguments = comand.taskArgs
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
                completion(dataResult,comand.type)
            }
        }
        task.launch()
    }
    
    
    
    
    
    
    
    
    //MARK: ---------------------- TIMERS ---------------------------
    
    
    
    func timerStart() {
        
        timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(self.timerAction), userInfo: nil, repeats: true)
        print("timerStart()")
        
    }
    
    func timerStart2() {
        
        timer2 = Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(self.timerAction2), userInfo: nil, repeats: true)
        print("timerStart2()")
        
    }
    
    
    
    
    
    
    @objc func timerAction() {
        print("timer Action()")
        
        
        run(comand:comand1) { (results, comand) in
            self.comandsRunerDelegate?.finish(comand:comand, withResult:results)
        }
        
        
        
    }
    
    
    
    @objc func timerAction2() {
        print("timer Action2()")
        
        run(comand:comand2) { (results, comand) in
            self.comandsRunerDelegate?.finish(comand:comand, withResult:results)
        }
        
        
    }
    
    
    
}
