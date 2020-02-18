//
//  HomeController.swift
//  iRevatureTrainingRoomRequests
//
//  Created by admin on 2/18/20.
//  Copyright © 2020 revature. All rights reserved.
//


import UIKit
import os.log

class HomeController: BaseController{
    
    @IBOutlet weak var welcomeLabel: UILabel!
    var userInfoBusinessService: UserInfoBusinessService = UserInfoBusinessService()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        //check for existing userinfo data in userdefaults if found update the email textfield
        if let currentUserInfo:User = userInfoBusinessService.getUserInfo()
        {
            
            let name = currentUserInfo.name
                
            welcomeLabel.text = "Welcome back \(name)"
         
        }
        
    }
    
}
