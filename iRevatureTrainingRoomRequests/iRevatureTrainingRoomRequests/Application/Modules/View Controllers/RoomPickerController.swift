//
//  RoomPickerController.swift
//  iRevatureTrainingRoomRequests
//
//  Created by Nathan Coggins on 2/14/20.
//  Copyright © 2020 revature. All rights reserved.
//

import UIKit
import os.log

//Class for the picking the room
class RoomPickerController: UIViewController, UITableViewDataSource, UITableViewDelegate, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var roomTableView: UITableView!
    @IBOutlet weak var roomPickerView: UIPickerView!
    @IBOutlet weak var roomSegControl: UISegmentedControl!
    
    var test2: [String] = []
    var result: [String] = []
    var selectedRoom:Int = -1
    var roomResult:Int = Int()
    var room: Room = Room()
    public var displayedRoom: [String] = []
    
    //back to location picker
    @IBAction func backToLocations(_ sender: Any) {
        let locationVC:LocationPickerController = UIStoryboard(name: "LocationPicker", bundle:nil).instantiateViewController(withIdentifier: "LocationPicker") as! LocationPickerController
        locationVC.modalPresentationStyle = .fullScreen
        os_log("Make Request",log: OSLog.default, type: .info)
        present(locationVC, animated: false, completion: nil)
    }
    
    //Initializes the table view and picker view
    override func viewDidLoad() {
        super.viewDidLoad()
        // setupTableView()
        roomTableView.delegate = self
        roomTableView.dataSource = self
        
        self.roomPickerView.delegate = self
        self.roomPickerView.dataSource = self
        createItems()
    }
    
    //Moves to the Request Screen and sends the information required over
    @IBAction func submitButton(_ sender: Any) {
        let objSecondVC = self.storyboard!.instantiateViewController(withIdentifier: "TrainerWorkFlow1") as! RequestController
        objSecondVC.selectedRoom2 = roomResult
        self.navigationController?.pushViewController(objSecondVC, animated: true)
        objSecondVC.modalPresentationStyle = .fullScreen
        os_log("Room picked",log: OSLog.default, type: .info)
        self.present(objSecondVC, animated: true, completion: nil)
    }
   
    //sets the number of table view columns
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //sets the number of table view rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    //Populates the table view with room information chosen
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        displayedRoom = []
        let room = roomByNumber(number: roomResult)
        let cell = roomTableView.dequeueReusableCell(withIdentifier: "roomCell", for: indexPath) as! RoomTableViewCell
        displayedRoom.append("Room #: \((room?.roomNumber)!)")
        displayedRoom.append("Batch Name: \((room?.batchName)!)")
        displayedRoom.append("Instructor Name: \((room?.instructorName)!)")
        cell.roomNumber?.text = displayedRoom[indexPath.row]
        return cell
    }
    
    //sets te number of components in picker view
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    //sets the number of rows in picker view
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return result.count
    }
    
    //Populates the picker view
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return result[row]
    }
    
    //Grabs the chosen value of picker view and updates the table view with the chosen room
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        // use the row to get the selected row from the picker view
        // using the row extract the value from your datasource (array[row])
        let selectedRoom = result[row].description
        let room = String(selectedRoom[selectedRoom.index(after: selectedRoom.index(of: " ")!)...])
        roomResult = Int(room)!
        self.roomTableView.reloadData()
    }
    
    //Creates the array to be shown in the picker view
    func createItems(){
        let rooms:[Room] = selectAllRooms()
        for room in rooms{
            let tempResult = room.roomNumber
            result.append("Room \(tempResult!)")
        }
    }
    
    
}

