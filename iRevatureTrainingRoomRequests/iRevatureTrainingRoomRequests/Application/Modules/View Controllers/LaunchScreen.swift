//
//  LaunchScreen.swift
//  iRevatureTrainingRoomRequests
//
//  Created by admin on 2/17/20.
//  Copyright © 2020 revature. All rights reserved.
//

import Foundation

class LaunchScreen: BaseController{
    
    var userInfoBusinessService: UserInfoBusinessService = UserInfoBusinessService()

    override func viewDidAppear(_ animated: Bool) {
        if let currentUserInfo:User = userInfoBusinessService.getUserInfo(){
            let keepLoggedIn = currentUserInfo.keepmelogged
            
//            if keepLoggedIn == true{
//                performSegue(withIdentifier: "HomeScreen", sender: <#T##Any?#>)
//            }
//            else{
//                performSegue(withIdentifier: "Login", sender: <#T##Any?#>)
//            }
        }
    }
}
