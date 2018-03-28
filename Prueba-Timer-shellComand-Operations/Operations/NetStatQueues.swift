//
//  NetStatQueues.swift
//  Kuru_Threads-timers-Task
//
//  Created by Kurushetra on 2/3/18.
//  Copyright © 2018 Kurushetra. All rights reserved.
//

import Foundation



class NetStatQueues  {

 
    private let operationQueue: OperationQueue = OperationQueue()

    public init() {
 
    }

    
    
    
    func getFireWallState(onCompleted: ((String) -> ())?) {
 
        let fireWallStateOperation = FireWallStateOperation()
        let parseFireWallStateOperation =  ParseFireWallStateOperation()
        
        fireWallStateOperation.completionBlock = {
            print("fireWallState  acabado")
//           parseFireWallStateOperation.responseData = fireWallStateOperation.responseData
            
        }

        parseFireWallStateOperation.completionBlock = {
            print("NetStat  acabado")
             onCompleted?("Han Acabado los dos")
//            print(parseFireWallStateOperation.resultData ?? "nada")
            
        }
        
        parseFireWallStateOperation.addDependency(fireWallStateOperation)
        operationQueue.addOperations([parseFireWallStateOperation, fireWallStateOperation], waitUntilFinished:true)
        
    }

    
    
}
