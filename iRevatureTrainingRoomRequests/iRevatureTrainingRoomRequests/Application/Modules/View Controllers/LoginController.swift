//
//  ViewController.swift
//  iRevatureTrainingRoomRequests
//
//  Created by Nathan Coggins on 2/11/20.
//  Copyright © 2020 revature. All rights reserved.
//

import UIKit
import os.log


class LoginController: BaseController {


    @IBOutlet weak var keepMeLoggedSwitch: UISwitch!
    @IBOutlet weak var failureMsgLabel: UILabel!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    var userInfoBusinessService: UserInfoBusinessService = UserInfoBusinessService()
    
    override func viewDidLoad() {
        
                super.viewDidLoad()
        
           
        //check for existing userinfo data in userdefaults if found update the email textfield
        if let currentUserInfo:User = userInfoBusinessService.getUserInfo()
        {
            
            let email = currentUserInfo.email
                
            usernameTextField.text = email
         
        }
        
    }
    
    //Perform login - event handler for Login button
    @IBAction func loginButton(_ sender: Any) {
        //present(LocationVC, animated: false, completion: nil)
        
         let username:String = usernameTextField.text!
        
         let password:String = passwordTextField.text!
       
        
        performAuthentication(loginName: username, password: password)
        
    }
    
    
    //Do login validation
    func performAuthentication(loginName:String,password:String)
    {
        
        let userKeepMeLogged = keepMeLoggedSwitch.isOn
        
        #warning("just using with a dummy user account , later replace this code with dynamic user account")
        
        
        if(loginName == "testuser1@revature.com" && password == "test123")
        {
            let userInfoData:User = User(name: loginName, role: "", email: loginName, token: "",keepmelogged:userKeepMeLogged)
            
            userInfoBusinessService.setUserInfo(userObject: userInfoData)
            
            os_log("UserInfo Updated",log: OSLog.default, type: .info)
            debugPrint("UserInfo Updated")
            os_log("User logged in",log: OSLog.default, type: .info)
            
            performSegue(withIdentifier: "homePageSegue", sender: self)
            
        }

      else{
            failureMsgLabel.text = "Invalid Credentials,Please try again"
            
            os_log("Login failed",log: OSLog.default, type: .info)
            debugPrint("Login Failed")
        }
        
    }

 //   let LocationVC:LocationPickerController = UIStoryboard(name: "LocationPicker", bundle:nil).instantiateViewController(withIdentifier: "LocationPicker") as UIViewController as! LocationPickerController
}
