//
//  SplashviewControllerViewController.swift
//  leisureMap
//
//  Created by stu1 on 2018/7/23.
//  Copyright © 2018年 stu1. All rights reserved.
//

import UIKit

class SplashviewControllerViewController: UIViewController {

    @IBOutlet weak var labverson: UILabel!
    override func viewDidLoad() {
        
        var appversion : String = ""
       // weak var labverson: UILabel!
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let defaults : UserDefaults = UserDefaults.standard
        defaults.synchronize()
        
        appversion = "" + (Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String)!
        labverson.text = appversion
        //labverson.text = appversion
        
        let from = "https://score.azurewebsites.net/api/version/\(String(describing: appversion))"
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
                
                print(responseStrin)
                
                
            }
            
            //print("here")
        })
        task.resume()
        
        
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
