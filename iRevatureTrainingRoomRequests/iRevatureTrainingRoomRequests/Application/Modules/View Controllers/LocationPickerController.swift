//
//  LocationPickerController.swift
//  iRevatureTrainingRoomRequests
//
//  Created by Nathan Coggins on 2/14/20.
//  Copyright © 2020 revature. All rights reserved.
//

import UIKit
import os.log
class LocationPickerController: BaseController, UIPickerViewDelegate, UIPickerViewDataSource{
    
    @IBOutlet weak var locationPickerView: UIPickerView!
    @IBOutlet weak var welcomeTextField: UILabel!
    
    var test = userInfo.getUserInfoDB()
    var test2: [String] = []
    var result: [String] = []
    var roomResult0:Int = Int()
    var rooms:[Room] = selectAllRooms()

    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return result.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return result[row]
    }
    
    func createItems(){
        let locations:[Location] = selectAllLocations()!
        for location in locations{
            result.append(location.State + "-" + location.Campus + "-" + location.Building)
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.locationPickerView.delegate = self
        self.locationPickerView.dataSource = self
        createItems()
    }

    
    @IBAction func logOutButton(_ sender: Any) {
        //present(backVC, animated: false, completion: nil)
        let storyboard = UIStoryboard(name: "Login", bundle: nil)
        
        // Instantiate the desired view controller from the storyboard using the view controllers identifier
        // Cast is as the custom view controller type you created in order to access it's properties and methods
        let customViewController = storyboard.instantiateViewController(withIdentifier: "HomeScreen")
        present(customViewController, animated: false, completion: nil)
        os_log("User logged out",log: OSLog.default, type: .info)
    }
    
    @IBAction func submitButton(_ sender: Any) {
        let roomResult0 = rooms[0].roomNumber
        let TrainerVC:UIViewController = UIStoryboard(name: "TrainerWorkFlow", bundle:nil).instantiateViewController(withIdentifier: "TrainerWorkFlow0") as UIViewController
        TrainerVC.roomResult = roomResult0
        present(TrainerVC, animated: false, completion: nil)
    }

    let TrainerVC:UIViewController = UIStoryboard(name: "TrainerWorkFlow", bundle:nil).instantiateViewController(withIdentifier: "TrainerWorkFlow0") as UIViewController
    
}

