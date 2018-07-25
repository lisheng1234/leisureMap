//
//  LoginViewController.swift
//  leisureMap
//
//  Created by stu1 on 2018/7/23.
//  Copyright © 2018年 stu1. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var textAccout: UITextField!
    @IBOutlet weak var texPass: UITextField!
    @IBOutlet weak var btn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

//    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//        textField.tagif
//    }
    
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

}
