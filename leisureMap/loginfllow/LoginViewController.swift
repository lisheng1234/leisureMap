//
//  LoginViewController.swift
//  leisureMap
//
//  Created by stu1 on 2018/7/23.
//  Copyright © 2018年 stu1. All rights reserved.
//

import UIKit
import SwiftyJSON

class LoginViewController: UIViewController,UITextFieldDelegate,AsyncResponseDelegate,FileWorkerDelegate {
    
    
    func fileWorkWriteCompleted(_ sender: FileWorker, filename: String, tag: Int) {
        print("123")
    }
    
    func fileWorkReadCompleted(_ sender: FileWorker, content: String, tag: Int) {
        print("32323")
    }
    
   
   
    

    @IBOutlet weak var textAccout: UITextField!
    @IBOutlet weak var texPass: UITextField!
    @IBOutlet weak var btn: UIButton!
    
     var requestWorker :AsyncRequesteWorker?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //
        
        requestWorker = AsyncRequesteWorker()
        requestWorker?.reponseDelegate = self
        

        print("133213")
     
        
        
    }
    
  

    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        //a
        let accept = "abcdeABCDE"//
        let cs = NSCharacterSet(charactersIn: accept).inverted
        //['a','b','c]
        let filtered = string.components(separatedBy: cs).joined(separator: "")
         //["a","b","c"]
        if(string != filtered){
            return false
        }
        
        //MAX legth
        
        var maxlegth : Int = 0
        
        if textField.tag == 1{
             maxlegth = 4
        }
        if textField.tag == 2{
            maxlegth = 5
        }
        
        let currentString :NSString = textField.text! as NSString
        let newstring :NSString = currentString.replacingCharacters(in: range, with: string) as NSString
        return newstring.length <= maxlegth
        
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.tag == 1{
           textField.resignFirstResponder()
           texPass.becomeFirstResponder()
            
        }
        if textField.tag == 2{
            textField.resignFirstResponder()
        }
        return true
    }
    
    //MARK :AsyncRequesteWorker
    
    @IBAction func btnloginclicked(_ sender: Any) {
        
        let accout = textAccout.text!
        let password = texPass.text!
        let from = "https://score.azurewebsites.net/api/login/\(accout)/\(password)"
        self.requestWorker?.getResponse(from: from, tag: 1)
        
    }
    
    func readServiceCategorey(){
        let from = "https://score.azurewebsites.net/api/servicecategory/"
        self.requestWorker?.getResponse(from: from, tag: 2)
    }
    
    func readStore(){
        let from = "https://score.azurewebsites.net/api/store"
        self.requestWorker?.getResponse(from: from, tag: 3)
    }
    
    func receivedRespose(_ sender: AsyncRequesteWorker, responseString: String, tag: Int) {
        print("\(tag):\(responseString)" )
        
        switch tag {
        case 1:
            //login
            self.readServiceCategorey()
            break
        case 2:
            //servicecategory
            do{
                if let dataFromString = responseString.data(using: .utf8, allowLossyConversion: false) {
                    let json = try JSON(data: dataFromString)
                    
                    for (index,subJson):(String, JSON) in json {
                        // Do something you want
                        let index : Int = subJson["index"].intValue
                        let name : String = subJson["name"].stringValue
                        let imagePath : String = subJson["imagePath"].stringValue
                        print("\(index):\(name)")
                    }
                    
                    
                    
                }
                
                
            }catch{
                print(error)
            }
            
            
           
            
            self.readStore()
            break
        case 3:
            
            do{
                if let dataFromString = responseString.data(using: .utf8, allowLossyConversion: false) {
                    let json = try JSON(data: dataFromString)
                    
                    for (_,subJson):(String, JSON) in json {
                        // Do something you want
                        let serviceIndex : Int = subJson["serviceIndex"].intValue
                        let name : String = subJson["name"].stringValue
                        let index : String = subJson["index"].stringValue
                        let imagePath : String = subJson["imagePath"].stringValue
                        let location : JSON = subJson["location"]
                        let address :String = location["name"].stringValue
                        let latitude :Double = location["latitude"].doubleValue
                        let longitude :Double = location["longitude"].doubleValue
                        print("\(index):\(name):latitude:\(latitude):latitude:\(longitude)")
                    }
                    
                    
                    
                }
                
                
            }catch{
                print(error)
            }
            
            
            
            //store
                    DispatchQueue.main.async {
                        self.performSegue(withIdentifier: "tomovemasterview", sender: self)
                    }
            break
        default:
            break
        }
        
        //labverson.text = responseString
     
        
//        DispatchQueue.main.async {
//            self.performSegue(withIdentifier: "moveToLoginView", sender: self)
//        }
        
    }
    
    

}
