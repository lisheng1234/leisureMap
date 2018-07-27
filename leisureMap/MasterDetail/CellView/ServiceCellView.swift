//
//  ServiceCellView.swift
//  leisureMap
//
//  Created by stu1 on 2018/7/27.
//  Copyright © 2018年 stu1. All rights reserved.
//

import UIKit

class ServiceCellView: UICollectionViewCell {
    
    @IBOutlet weak var bgIamgeView: UIImageView!
    @IBOutlet weak var lbname: UILabel!
    
    func updateContent(service : ServiceCategory) -> Void {
        lbname.text = service.Name
    }
    
    
    
}
