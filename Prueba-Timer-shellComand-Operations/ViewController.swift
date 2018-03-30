//
//  ViewController.swift
//  Prueba-Timer-shellComand-Operations
//
//  Created by Kurushetra on 20/3/18.
//  Copyright © 2018 Kurushetra. All rights reserved.
//

import Cocoa
import KUShellTask




class ViewController: NSViewController {
 

    @IBOutlet weak var salidaComando1: NSScrollView!
    @IBOutlet weak var salidaComando2: NSScrollView!
    
    
    @IBAction func backgroundTimer(_ sender: Any) {
        
    }
    @IBAction func normaltimer(_ sender: Any) {
//        comandsRuner.run(comand: NetStat(), forEver: true)
    }
    @IBAction func operationsComands(_ sender: Any) {

    }
    
    @IBAction func shellComand(_ sender: Any) {
        
    }
    @IBAction func comadRuner(_ sender: Any) {
    }
    
    @IBAction func comad1(_ sender: Any) {
//      comandsRuner.run(comand: NetStat(), forEver: false)
    }
    @IBAction func comad2(_ sender: Any) {
//      comandsRuner.run(comand:FireWallState(), forEver: true)
    }
    @IBAction func slider1(_ sender: NSSlider) {
        print("------ Slider -- 1")
        print(sender.integerValue)
    }
    @IBAction func slider2(_ sender: NSSlider) {
        print("------ Slider -- 2")
        print(sender.integerValue)
    }
    
    
    
    
    
 
 
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       ComandsRuner.comandsRunerId = ""
        
        
        ComandsRuner.run(comand:"fireWallState", forEver: false) { (result) in
            print(result)
        }
        
        
        
//        ComandsRuner.run(comand:"mtRoute", forEver: false) { (result) in
//            print(result)
//        }
        
//        do {
//            try ComandsRuner.setPraser(praser:algoPrasable())
//
//            ComandsRuner.run(comand:"fireWallState", forEver: false) { (result) in
//                print(result)
//            }
//
//        }
//        catch let error as ComandsRunerError {
//            print(error)
//        }
//        catch {
//        print("""
//        Something went wrong...
//        NOT ha ComandsRunerError
//        """)
//        }
        
        
        
        
 
        
    }
    
    
 
    
    
    
    
}


struct algoPrasable:Prasable {
    func prase(comandResult: String) -> Any {
        return "Praseado"
    }
}



//    let pip: () -> () = {
//
//        let task: Process = {
//            let t = Process()
//            t.launchPath = "/usr/local/bin/pip"
//            t.arguments = ["list"]
//            t.standardOutput = Pipe()
//            return t
//        }()
//
//
//
//
//        let handle: (Process) -> () = { task in
//            defer { CFRunLoopStop(CFRunLoopGetMain()) }
//
//            guard task.terminationStatus == 0,
//                let data = (task.standardOutput as? Pipe)?.fileHandleForReading.availableData,
//                data.count > 0,
//                let s = String(data:data, encoding: .utf8)
//                else {
//                    return
//
//            }
//
//            let packages = s.components(separatedBy: "\n")
//            //            resultado = packages
//
//
//            for (i, package) in packages.enumerated() {
//                print(i, package)
//            }
//        }
//
//
//        task.terminationHandler = handle
////        task.standardOutput
//        task.launch()
//    }



//    func task() {
//
//        var resultado:[String]!
//
//        let task: Process = {
//            let t = Process()
//            t.launchPath = "/usr/local/bin/pip"
//            t.arguments = ["list"]
//            t.standardOutput = Pipe()
//            return t
//        }()
//
//
//
//        let handle: (Process) -> () = { task in
//            defer { CFRunLoopStop(CFRunLoopGetMain()) }
//
//            guard task.terminationStatus == 0,
//                let data = (task.standardOutput as? Pipe)?.fileHandleForReading.availableData,
//                data.count > 0,
//                let s = String(data:data, encoding: .utf8)
//                else {
//                    return
//
//            }
//
//            let packages = s.components(separatedBy: "\n")
//            resultado = packages
//
////            for (i, package) in packages.enumerated() {
////                print(i, package)
////            }
//        }
//
//
//
//        let pip: () -> () = { ()
//
//            task.terminationHandler = handle
//            task.launch()
//        }
//

