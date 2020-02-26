//
//  ViewController.swift
//  iRevatureTrainingRoomRequests
//
//  Created by Nathan Coggins on 2/11/20.
//  Copyright © 2020 revature. All rights reserved.
//

import UIKit
import os.log
import Alamofire
import SwiftyJSON

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
        let login = Login(username: username, password: password)
        performAuthentication(login: login)
    }
    
    
    //Do login validation
    //    func performAuthentication(loginName:String,password:String)
    //    {
    //        let userKeepMeLogged = keepMeLoggedSwitch.isOn
    //        #warning("just using with a dummy user account , later replace this code with dynamic user account")
    //        if(loginName == "testuser1@revature.com" && password == "test123")
    //        {
    //            let userInfoData:User = User(name: loginName, role: "", email: loginName, token: "",keepmelogged:userKeepMeLogged)
    //            userInfoBusinessService.setUserInfo(userObject: userInfoData)
    //            os_log("UserInfo Updated",log: OSLog.default, type: .info)
    //            debugPrint("UserInfo Updated")
    //            os_log("User logged in",log: OSLog.default, type: .info)
    //            performSegue(withIdentifier: "homePageSegue", sender: self)
    //        }
    //
    //      else{
    //            failureMsgLabel.text = "Invalid Credentials,Please try again"
    //            os_log("Login failed",log: OSLog.default, type: .info)
    //            debugPrint("Login Failed")
    //        }
    //    }
    func performAuthentication(login: Login){
        let userKeepMeLogged = keepMeLoggedSwitch.isOn
        let loginapi = RestAlamoFireManager()
        loginapi.postLogin(login: login, completionHandler: { user in
            print(user)
            if(user.statusCode == 201){
                let userData = User(name: login.username, role: user.currentSystemRole.name, email: login.username, token: user.loginToken, keepmelogged: userKeepMeLogged)
                if self.userInfoBusinessService.setUserInfo(userObject: userData) {
                    print("User preferences stored")
                    self.navigateToLocationPicker()
                } else {
                    print("Something went wrong")
                }
            } else {
                self.failureMsgLabel.text = "Invalid Credentials,Please try again"
                os_log("Login failed",log: OSLog.default, type: .info)
                debugPrint("Login Failed")
            }})
    }
    
    func navigateToLocationPicker(){
        let storyboard = UIStoryboard(name: "LocationPicker", bundle: nil)
        let view = storyboard.instantiateInitialViewController()
        view?.modalPresentationStyle = .fullScreen
        self.present(view!, animated: true, completion: nil)
    }
}
