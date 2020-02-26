//
//  HomeController.swift
//  iRevatureTrainingRoomRequests
//
//  Created by admin on 2/18/20.
//  Copyright © 2020 revature. All rights reserved.
//


import UIKit
import os.log

//Class that manages the Home Screen functionality
class HomeController: BaseController{
    var userInfoBusinessService: UserInfoBusinessService = UserInfoBusinessService()
    var roomInfoBusinessService: RoomInfoBusinessService = RoomInfoBusinessService()
    var locationInfoBusinessService: LocationBusinessService = LocationBusinessService()
    
    @IBOutlet weak var welcomeLabel: UILabel!
    
    //Method that transitions to the Trainer workflow
    @IBAction func makeRequest(_ sender: Any) {
        let locationVC:LocationPickerController = UIStoryboard(name: "LocationPicker", bundle:nil).instantiateViewController(withIdentifier: "LocationPicker") as! LocationPickerController
        os_log("Make Request",log: OSLog.default, type: .info)
        present(locationVC, animated: false, completion: nil)
    }
    
    //feature coming soon to view requests
    @IBAction func viewRequests(_ sender: Any) {
        let alert = UIAlertController(title: "View Requests", message: "Feature coming soon", preferredStyle: .alert)

    alert.addAction(UIAlertAction(title: "Acknowledge", style: .default, handler: nil))

    self.present(alert, animated: true)
    }
    
    //feature coming soon to cancel a request
    @IBAction func cancelRequests(_ sender: Any) {
    let alert = UIAlertController(title: "Cancel Requests", message: "Feature coming soon", preferredStyle: .alert)

    alert.addAction(UIAlertAction(title: "Acknowledge", style: .default, handler: nil))

    self.present(alert, animated: true)
    }
    
    //overriding view did load to refresh local database
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        refreshLocalDatabase()
        
        //check for existing userinfo data in userdefaults if found update the email textfield
        if let currentUserInfo:User = userInfoBusinessService.getUserInfo()
        {
            let name = currentUserInfo.name
            welcomeLabel.text = "\(name)"
        }

    }
    
    //method that refreshs athe database from API
    func refreshLocalDatabase(){
        userInfoBusinessService.setUserInfoDB()
        locationInfoBusinessService.setLocationInfoDB()
        roomInfoBusinessService.setRoomInfoDB()
    }
    
    
}
