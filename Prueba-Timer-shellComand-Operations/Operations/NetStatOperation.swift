//
//  NetStatOperation.swift
//  Kuru_Threads-timers-Task
//
//  Created by Kurushetra on 1/3/18.
//  Copyright © 2018 Kurushetra. All rights reserved.
//

import Foundation


class NetStatOperation: TaskOperation {
    
//    private let urlString: String
//    private let provider: NetworkingProvider
    
    var responseData: String?
    
//    init(withURLString urlString: String, andNetworkingProvider provider: NetworkingProvider = AFNetworkConnector()) {
//        self.urlString = urlString
//        self.provider = provider
//    }
    override init() {
      
    }
    
    override func main() {
        guard isCancelled == false else {
            finish(true)
            return
        }
        
        executing(true)
//        provider.restCall(urlString: urlString) { (data) in
//            self.responseData = data
//            self.executing(false)
//            self.finish(true)
//        }
    }
}
