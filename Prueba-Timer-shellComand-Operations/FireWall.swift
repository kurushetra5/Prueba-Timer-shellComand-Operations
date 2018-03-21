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
    func fireWallEstablished(ips:[NetStatConection])
    func fireWallBlocked(ips:[NetStatConection])
    func fireWall(state:Bool)
    func fireWallDidUnblockIp()
    func fireWallDidBlockIp()
    func fireWallDidStart()
    func fireWallDidStop()
}







//MARK: --------  Class  FireWall  ---------------
class FireWall: ComandRunerDelegate,ComandRunerDelegate2 ,comandDelegate {
    
    
    
    
    //MARK: --------  Class  VARS  ---------------
    public var comandRuner:ComandRuner = ComandRuner()
    public var comandRuner2:ComandRuner = ComandRuner()
    
    
    
    var queue1:DispatchQueue!
    var queue2:DispatchQueue!
    let netStat = NetStat()
    let netPraser = netStatPraser()
    
    var  netStat2:AppTaskComand!
    var timer:Timer!
    var timer2:Timer!
    
    
//    private var ipsManager:IpsManager = IpsManager()
//    private var needUpdateState:Bool = true
//    private var needUpdateConections:Bool = true
//    private var needUpdateBlockedIps:Bool = false
//    private var isTimerRuning:Bool = false
    var fireWallDelegate:FireWallDelegate!
    
   
    
    
    
    init() {
        comandRuner.comandRunerDelegate = self //FIXME: dosobjetos de lo mismo delegados se mezclan las cosas .....
        comandRuner2.comandRunerDelegate2 = self
      print("init()FireWall ")
    }
    
    
    
    
    
    
    
    public func startBackgroundTimer() {
        
//        netStat2 = AppTaskComand(comand:netStat, praser:netPraser, delegate:self)
//        backgroundTimer()
        print("start BackgroundTimer()")
        backgroundTimer()
    }
    
    public func stopBackgroundTimer() {
        print("stop BackgroundTimer()")
//        netStat2 = AppTaskComand(comand:netStat, praser:netPraser, delegate:self)
//        backgroundTimer()
        
    }
    
    
    
    public   func operations()  {
        print("operations()")
    }
    
    
    
    
    
    
    //MARK: --------  Public Funcs  ---------------
    
    public  func runcomand1(comand:Comand) {
        
        print("runcomand 1")
//        let infoComand = AppTaskComand(comand:comand,
//                                          praser:GenericPraser(),
//                                          delegate: self)
//        infoComand.run()
    }
    
   public func runcomand2(comand:Comand) {
        
        print("runcomand 2")
//        let infoComand = AppTaskComand(comand:comand,
//                                       praser:GenericPraser(),
//                                       delegate: self)
//        infoComand.run()
    }
    
    
    
    public func  comand1(comand:Comand) {
        
        print("comand 1")
//        let infoComand = AppTaskComand(comand:comand,
//                                       praser:GenericPraser(),
//                                       delegate: self)
//        infoComand.run()
    }
    
    
    public func  comand2(comand:Comand) {
        
        print("comand 2")
//        let infoComand = AppTaskComand(comand:comand,
//                                       praser:GenericPraser(),
//                                       delegate: self)
//        infoComand.run()
    }
    
    
    
    public   func normalTimer()  {
        
        print("Normal Timer")
        timerStart()
//        timerStart2()
//        runComands()
//    let state = FireWallState()
//    let fireWallStatePraser = StatePraser()
//
//    let fireWallState = AppTaskComand(comand:state, praser:fireWallStatePraser, delegate:self)
//    fireWallState.run()
        
//       comandRuner.runComand(type:.fireWallState, ip: nil)
        
        
 
    }
    
    
    
 
    
  
    
   
  
    
   
    
    
    
    //MARK: --------  ComandDelegate ---------------
    func comand(finish: ComandType, result: Any) { //TODO: devolver comand con data prased o data tuple prased y comad type ??
        
        print("ComandDelegate finish")
//        if finish == .netStat {
//            needUpdateState = true
//            needUpdateConections = false
//        }else  if finish == .fireWallState {
//            needUpdateState = false
//            needUpdateConections = true
//        }
    }
    
    
    
    //MARK: --------  ComandRuner Delegate ---------------
    func comand(finishWith data: String) {
        print("ComandRuner Delegate finish")
    }
    
    func comand(type:String, finishWith data: String) {
        print("ComandRuner Delegate finish")
//        print(type)
    }
    
    
    func comand2(type:String, finishWith data: String) {
        print("ComandRuner2 Delegate2 finish")
        //        print(type)
    }
    
    
    
    
    
    
   
    
    
    func timerStart2() {
        
        timer2 = Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(self.timerAction2), userInfo: nil, repeats: true)
        print("timerStart2()")
        
    }
    
    func timerStart() {
        
        timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(self.timerAction), userInfo: nil, repeats: true)
       print("timerStart()")
        
    }
    
    
    
    private func backgroundTimer()  {
//        isTimerRuning = true
        
        print("backgroundTimer")
        
        DispatchQueue.global(qos:.background).async{
            let timer:Foundation.Timer = Foundation.Timer.scheduledTimer(timeInterval:2, target: self, selector: #selector(self.backgroundTimerAction(_:)), userInfo: nil, repeats: true);
            //            print("State Timer  running on = \(Thread.isMainThread ? "Main Thread":"Background Thread")")
            let runLoop:RunLoop = RunLoop.current;
            runLoop.add(timer, forMode: RunLoopMode.defaultRunLoopMode);
            runLoop.run();
            
        }
    }
    
    @objc func timerAction() {
     print("timer Action()")
        runComands()
//           runTask1()
//        comandRuner.runComand(type:"fireWallState", ip: nil)
//        runTask2()
    }
    
    @objc func timerAction2() {
        print("timer Action2()")
//        runComands()
         comandRuner2.runComand(type:"netStat", ip: nil)
        //          runTask1()
//                runTask2()
    }
    
    
    
    @objc func backgroundTimerAction(_ timer: Foundation.Timer) -> Void {
        
//        self.runComands()
//        comandRuner.runComand(type:.fireWallState, ip: nil)
        
//        netStat2.run()
        
        print("Background TimerAction")
        runTask1()
        runTask2()
//        runTask2()
    }
    
    
    
    
    private func runComands() {
        
        
        runTask1()
        runTask2()
        
    }

    
 
    func runTask1() {
        
//         queue2 = DispatchQueue(label: "com.knowstack.queue1", qos:.background, attributes: .concurrent, autoreleaseFrequency: .inherit, target: DispatchQueue.global())
//         queue2.sync {
//            timerStart()
        
            comandRuner.runComand(type:"fireWallState", ip: nil)
//         }
        
        
//        for _ in 0..<1000 {
//            print("runTask 1")
//        }
    }
    
    
    func runTask2() {
        
//         queue1 = DispatchQueue(label: "com.knowstack.queue2", qos:.background, attributes: .concurrent, autoreleaseFrequency: .inherit, target: DispatchQueue.global())
//         queue1.sync {
        
//            timerStart2()
            comandRuner.runComand(type:"netStat", ip: nil)

//        }
//        for _ in 0..<1000 {
//            print("runTask 2")
//         }
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






