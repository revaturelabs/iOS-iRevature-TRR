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
    var userInfoBusinessService: UserInfoBusinessService = UserInfoBusinessService()
    var roomInfoBusinessService: RoomInfoBusinessService = RoomInfoBusinessService()
    var locationInfoBusinessService: LocationBusinessService = LocationBusinessService()
    
    @IBOutlet weak var welcomeLabel: UILabel!
    
    @IBAction func makeRequest(_ sender: Any) {
        let locationVC:LocationPickerController = UIStoryboard(name: "LocationPicker", bundle:nil).instantiateViewController(withIdentifier: "LocationPicker") as! LocationPickerController
        os_log("Make Request",log: OSLog.default, type: .info)
        present(locationVC, animated: false, completion: nil)
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        refreshLocalDatabase()
        
        //check for existing userinfo data in userdefaults if found update the email textfield
        if let currentUserInfo:User = userInfoBusinessService.getUserInfo()
        {
            let name = currentUserInfo.name
            welcomeLabel.text = "Welcome back \(name)"
        }

    }
    func refreshLocalDatabase(){
        userInfoBusinessService.setUserInfoDB()
        locationInfoBusinessService.setLocationInfoDB()
        roomInfoBusinessService.setRoomInfoDB()
    }
    
    
}
