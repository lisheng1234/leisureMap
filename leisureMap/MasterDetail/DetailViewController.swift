//
//  DetailViewController.swift
//  leisureMap
//
//  Created by stu1 on 2018/7/25.
//  Copyright © 2018年 stu1. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var selectedStore : Store?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = selectedStore?.Name
        // Do any additional setup after loading the view.
    }

    @IBAction func btnMapClicked(_ sender: Any) {
        DispatchQueue.main.async {
            self.performSegue(withIdentifier: "tomovemapview", sender: self)
        }
    }
    @IBAction func btnWebClicked(_ sender: Any) {
        DispatchQueue.main.async {
            self.performSegue(withIdentifier: "tomovewebview", sender: self)
        }
    }
 
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "tomovemapview":
            break
        case "tomovewebview":
            break
        default:
            break
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
