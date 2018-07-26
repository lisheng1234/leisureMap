//
//  NetWorker.swift
//  leisureMap
//
//  Created by stu1 on 2018/7/26.
//  Copyright © 2018年 stu1. All rights reserved.
//

import Foundation
protocol AsyncResponseDelegate {
    func receivedRespose (_sender:AsyncRequesteWorker,responseString:String,tag:Int) -> Void
}
class AsyncRequesteWorker{
    var reponseDelegate : AsyncResponseDelegate?
    func getResponse(from :String,tag:Int) -> Void {
        let url = URL(string: from)!
        let request = URLRequest(url: url)
        
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        
        let task = session.dataTask(with: request, completionHandler: {(data,response,error) in
            
            let httpResponse = response as! HTTPURLResponse
            let statuscode = httpResponse.statusCode
            
            if (200 == statuscode){
                let datastring = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
                
                let responseStrin = String(datastring!)
    
                self.reponseDelegate?.receivedRespose(_sender: self, responseString:responseStrin, tag: tag)
            }
            
            //print("here")
        })
        task.resume()
        

    }
    
}
