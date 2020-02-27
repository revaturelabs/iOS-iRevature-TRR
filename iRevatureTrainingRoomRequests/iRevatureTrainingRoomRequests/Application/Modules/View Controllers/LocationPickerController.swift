//
//  LocationPickerController.swift
//  iRevatureTrainingRoomRequests
//
//  Created by Nathan Coggins on 2/14/20.
//  Copyright © 2020 revature. All rights reserved.
//

import UIKit
import os.log

//Class for location picking for room selection
class LocationPickerController: BaseController, UIPickerViewDelegate, UIPickerViewDataSource{
    
    @IBOutlet weak var locationPickerView: UIPickerView!
    @IBOutlet weak var welcomeTextField: UILabel!

    var test2: [String] = []
    var result: [String] = []
    var roomResult0:Int = Int()
    var rooms:[Room] = selectAllRooms()
    var selectedLocation:String = String()

    //Sets the number of componenets in picker view
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    //Sets the number of rows in picker view
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return result.count
    }
    
    //Populates the picker view
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return result[row]
    }
    
    //Not used at the moment
    //Used to grab the location of choosing to pass to next view controller
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
     {
         // use the row to get the selected row from the picker view
         // using the row extract the value from your datasource (array[row])
        
         //let selectedLocation = result[row].description
     }
    
    //Creates an array to be displayed in the picker view
    func createItems(){
        let locations:[Location] = selectAllLocations()!
        result.removeAll(keepingCapacity: false)
        for location in locations{
            result.append((location.State!) + "-" + location.Campus! as String + "-" + location.Building! as String)
        }
        
    }
    
    //Loads up the picker view and creates the array for the picker view
    override func viewDidLoad() {
        super.viewDidLoad()
        self.locationPickerView.delegate = self
        self.locationPickerView.dataSource = self
        createItems()
    }
    
    //Logs out, moves back to login screen
    @IBAction func logOutButton(_ sender: Any) {
        //present(backVC, animated: false, completion: nil)
        let storyboard = UIStoryboard(name: "Login", bundle: nil)
        
        // Instantiate the desired view controller from the storyboard using the view controllers identifier
        // Cast is as the custom view controller type you created in order to access it's properties and methods
        let customViewController = storyboard.instantiateViewController(withIdentifier: "HomeScreen")
        customViewController.modalPresentationStyle = .fullScreen
        present(customViewController, animated: false, completion: nil)
        os_log("User logged out",log: OSLog.default, type: .info)
    }
    
    //Move to the room picker controller and sends the proper info over
    @IBAction func submitButton(_ sender: Any) {
        let roomResult0 = rooms[0].roomNumber
        let TrainerVC:RoomPickerController = UIStoryboard(name: "TrainerWorkFlow", bundle:nil).instantiateViewController(withIdentifier: "TrainerWorkFlow0") as! RoomPickerController
        TrainerVC.roomResult = roomResult0!
        TrainerVC.modalPresentationStyle = .fullScreen
        os_log("Location picked",log: OSLog.default, type: .info)
        present(TrainerVC, animated: false, completion: nil)
    }

    let TrainerVC:UIViewController = UIStoryboard(name: "TrainerWorkFlow", bundle:nil).instantiateViewController(withIdentifier: "TrainerWorkFlow0") as UIViewController
    
}

