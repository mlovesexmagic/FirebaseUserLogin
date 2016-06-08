//
//  ViewController.swift
//  FirebaseUserLogin
//
//  Created by Zhipeng Mei on 6/7/16.
//  Copyright © 2016 Zhipeng Mei. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    @IBOutlet var userLogin: UITextField!
    @IBOutlet var userPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func CreateAccount(sender: AnyObject) {
        
        FIRAuth.auth()?.createUserWithEmail(userLogin.text!, password: userPassword.text!, completion: {
           
            user, error in
            
            if error != nil {
                self.login()
            }
            else {
                print("User Created")
                self.login()
            }
            
        })
        
        
    }
    
    
    func login() {
        FIRAuth.auth()?.signInWithEmail(userLogin.text!, password: userPassword.text!, completion: {
            user, error in
            
            if error != nil {
                print("Incorrect")
            }
            else {
                print("Yeahhhh")
            }
        })
    }

}

