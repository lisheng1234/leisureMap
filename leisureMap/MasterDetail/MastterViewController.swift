//
//  MastterViewController.swift
//  leisureMap
//
//  Created by stu1 on 2018/7/25.
//  Copyright © 2018年 stu1. All rights reserved.
//

import UIKit
import SwiftyJSON

class MastterViewController: UIViewController,FileWorkerDelegate,UICollectionViewDelegate,UICollectionViewDataSource,UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return displayStores.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
            let store = displayStores[indexPath.row]
            
        let cell = tableView.dequeueReusableCell(withIdentifier: "StoreCellView", for: indexPath) as! StoreCellView
            cell.updateContent(store: store)
            return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
     return   categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let category = categories[indexPath.row]
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ServiceCellView", for: indexPath) as! ServiceCellView
        cell.updateContent(service: category)
        return cell
    }
    
    
    var categories:[ServiceCategory] = []
    var stores:[Store] = []
    var displayStores:[Store] = []
    var selectedstore :Store?

    

    let storeFileName : String = "store.json"
    var fileWorker :FileWorker?
    
    override func viewDidLoad() {
        //
        let sqliteContext = SQLiteWorker()
        let categoriesInSQLite = sqliteContext.readData()
        categories = categories + categoriesInSQLite
        //
        super.viewDidLoad()
        fileWorker =  FileWorker()
        fileWorker?.fileWorkerDelegate =  self
        
        let content = self.fileWorker?.readFromFile(fileName: storeFileName, tag: 1)

                    do{
                        if let dataFromString = content?.data(using: .utf8, allowLossyConversion: false) {
                            let json = try JSON(data: dataFromString)
        
                            for (_,subJson):(String, JSON) in json {
                                // Do something you want
                                let store : Store = Store()
                                
                                let serviceIndex : Int = subJson["serviceIndex"].intValue
                                let name : String = subJson["name"].stringValue
                                let index : Int = subJson["index"].intValue
                                let imagePath : String = subJson["imagePath"].stringValue
                                let location : JSON = subJson["location"]
                                let address :String = location["name"].stringValue
                                let latitude :Double = location["latitude"].doubleValue
                                let longitude :Double = location["longitude"].doubleValue
                                //print("\(index):\(name):latitude:\(latitude):latitude:\(longitude)")
                                
                                store.ServiceIndex = serviceIndex
                                store.Name = name
                                store.Index = index
                    
                                store.ImagePath = imagePath
                                
                                store.StoreLocation = LocationDesc()
                                store.StoreLocation?.Address = address
                                store.StoreLocation?.Latitude = latitude
                                store.StoreLocation?.Longitude = longitude
                                
                                stores.append(store)
                            }
        
        
        
                        }
        
        
                    }catch{
                        print(error)
                    }
        displayStores = displayStores + stores
        
        
    }
    
    // MARK:-
    func fileWorkWriteCompleted(_ sender: FileWorker, filename: String, tag: Int) {
        print("fileWorkWriteCompleted")
    }
    
    func fileWorkReadCompleted(_ sender: FileWorker, content: String, tag: Int) {
        print("fileWorkReadCompleted")
    }


}
