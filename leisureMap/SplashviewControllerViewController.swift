//
//  SplashviewControllerViewController.swift
//  leisureMap
//
//  Created by stu1 on 2018/7/23.
//  Copyright © 2018年 stu1. All rights reserved.
//

import UIKit

class SplashviewControllerViewController: UIViewController,AsyncResponseDelegate {
   
    var requestWorker :AsyncRequesteWorker?
    
    

    @IBOutlet weak var labverson: UILabel!
    override func viewDidLoad() {
        
        var appversion : String = ""
       // weak var labverson: UILabel!
        super.viewDidLoad()

        // Do any additional setup after loading the view.
       
        
        appversion = "" + (Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String)!
       labverson.text = appversion
       
        requestWorker = AsyncRequesteWorker()
        requestWorker?.reponseDelegate = self
        
        let from = "https://score.azurewebsites.net/api/version/\(String(describing: appversion))"
        
        requestWorker?.getResponse(from: from, tag: 1)

        
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    //MARK :AsyncRequesteWorker
    func receivedRespose(_sender: AsyncRequesteWorker, responseString: String, tag: Int) {
        print(responseString)
        //labverson.text = responseString
        let defaults : UserDefaults = UserDefaults.standard
        
        defaults.set(responseString, forKey: "serviceVersion")
        
        defaults.synchronize()
        
        DispatchQueue.main.async {
            self.performSegue(withIdentifier: "moveToLoginView", sender: self)
        }
      
    }
    

}
