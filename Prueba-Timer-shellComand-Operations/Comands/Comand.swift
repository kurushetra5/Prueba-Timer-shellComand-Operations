//
//  Comand.swift
//  FireWarWall
//
//  Created by Kurushetra on 22/2/18.
//  Copyright © 2018 Kurushetra. All rights reserved.
//

import Foundation


protocol  ComandRunerDelegate {
    func comand(finishWith data:String)
    func comand(type:String, finishWith:String)
}


protocol  ComandRunerDelegate2 {
    
    func comand2(type:String, finishWith:String)
}



class  ComandRuner  {
    
    public var comandRunerDelegate:ComandRunerDelegate!
    public var comandRunerDelegate2:ComandRunerDelegate2!
 
    private var stateResult:String = "no set"
//     var comandType:ComandType!
    var comandType:String!
    
    
    
    public func runComand(type:String, ip:String!) {
        stateResult = "no set"
        comandType = type
        
        if type is ComandIp  {
            if ip == nil {
                print("runComand : Ip Es NILL")
                return
            }
        }
        
        switch type {
        case "netStat":
            run(comand:NetStat())
            
        case "fireWallState":
            run(comand:FireWallState())
           
         
        default:
            print("")
        }
        
    
    }
    
    
    
    
    
    
    
    
    
    
  private  func run(comand:Comand ) {
 
        let task = Process()
        task.launchPath = comand.taskPath
        task.arguments = comand.taskArgs
        
        let pipe = Pipe()
        task.standardOutput = pipe
        let fh = pipe.fileHandleForReading
        fh.waitForDataInBackgroundAndNotify()
        
        let notificationCenter = NotificationCenter.default
    notificationCenter.addObserver(self, selector: #selector(receivedData), name: NSNotification.Name.NSFileHandleDataAvailable, object: nil)
        
//           task.terminationHandler = {task -> Void in
    
//          print(comand)
//           print(self.comandType)
//           print(self.stateResult)
//             print("--------------")
            
//             if self.stateResult != "no set" {
//                 self.comandRunerDelegate?.comand(type:self.comandType, finishWith:self.stateResult)
//             }
    
//            print("--------------")
//           }
        task.launch()
    }
    
    
    
    
    @objc private func receivedData(notif : NSNotification) {
        
        let fh:FileHandle = notif.object as! FileHandle
        
        let data = fh.availableData
         if data.count > 1 { //TODO: buscar solucion
            let string =  String(data: data, encoding: String.Encoding(rawValue: String.Encoding.ascii.rawValue))
              self.stateResult = string!
//            print(string ?? "na")
//            print("--------------")
//            print(self.comandType)
//            print(self.stateResult)
//            print("--------------")
//              self.comandRunerDelegate?.comand(finishWith:string!)
            
            
//             DispatchQueue.main.sync {
                self.comandRunerDelegate?.comand(type:self.comandType, finishWith:string!)
//              }
//            self.comandRunerDelegate?.comand(type:self.comandType, finishWith:self.stateResult)

//           DispatchQueue.global().sync {
//                 self.comandRunerDelegate2?.comand2(type:self.comandType, finishWith:string!)
//            }
//            }
            
//              self.comandRunerDelegate?.comand(type:comandType, finishWith:string!)
//             self.comandRunerDelegate2?.comand2(type:comandType, finishWith:string!)
//              fh.waitForDataInBackgroundAndNotify()
          }
    }
    
    
    
    
    
}


