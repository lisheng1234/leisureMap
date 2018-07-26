//
//  FileWorker.swift
//  leisureMap
//
//  Created by stu1 on 2018/7/26.
//  Copyright © 2018年 stu1. All rights reserved.
//

import Foundation

protocol FileWorkerDelegate {
    func fileWorkWriteCompleted(_ sender:FileWorker,filename:String,tag :Int)
   func fileWorkReadCompleted(_ sender:FileWorker,filename:String,tag :Int)
}

class FileWorker {
    var fileWorkerDelegate :FileWorkerDelegate?
    func writeToFile(content:String,filename:String,tag:Int) {
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first{
            let fileURL = dir.appendingPathComponent(filename)
            do {
                try content.write(to: fileURL, atomically: false, encoding: .utf8)
                
                self.fileWorkerDelegate?.fileWorkWriteCompleted( self, filename: fileURL.absoluteString, tag: tag)
                
            }
            catch {print(error)}
            
            
        }
        
        
    }
    
}
