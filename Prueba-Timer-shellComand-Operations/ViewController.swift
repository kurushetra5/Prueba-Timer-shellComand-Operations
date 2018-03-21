//
//  ViewController.swift
//  Prueba-Timer-shellComand-Operations
//
//  Created by Kurushetra on 20/3/18.
//  Copyright © 2018 Kurushetra. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    
    ///probar con singleton o sin
    
    var appController:FireWall = FireWall()
    
    
    
    
    
    @IBOutlet weak var salidaComando1: NSScrollView!
    @IBOutlet weak var salidaComando2: NSScrollView!
    
    
    
    
    @IBAction func backgroundTimer(_ sender: Any) {
        appController.startBackgroundTimer()
    }
    
    @IBAction func normaltimer(_ sender: Any) {
        appController.normalTimer()
    }
    
    
    
    
    
    @IBAction func operationsComands(_ sender: Any) {
        appController.operations()
    }
    
    
    
    
    
    @IBAction func shellComand(_ sender: Any) {
        appController.comand1(comand: NetStat())
        
    }
    @IBAction func comadRuner(_ sender: Any) {
        
        appController.comand2(comand: NetStat())
       
    }
    
    
    
    
    @IBAction func comad1(_ sender: Any) {
           appController.runcomand1(comand:NetStat())
    }
    @IBAction func comad2(_ sender: Any) {
         appController.runcomand2(comand:FireWallState())
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
        
      
    }
    
    
    
    
    
    
    
    
    

    
    
    
    
    


}

