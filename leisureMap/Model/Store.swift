//
//  Store.swift
//  leisureMap
//
//  Created by stu1 on 2018/7/27.
//  Copyright © 2018年 stu1. All rights reserved.
//

import Foundation

class Store {
    var ServiceIndex : Int = 0
    var Name : String?
    var StoreLocation:LocationDesc?
    var Index :Int = 0
    var ImagePath :String?
    
}

class LocationDesc{
    //地址
    var Address :String?
    //地址维度
    var Latitude :Double?
    //地址经度
    var Longitude :Double?
    
    
}
