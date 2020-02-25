//
//  RoomPickerController.swift
//  iRevatureTrainingRoomRequests
//
//  Created by Nathan Coggins on 2/14/20.
//  Copyright © 2020 revature. All rights reserved.
//

import UIKit
import os.log

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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // setupTableView()
        roomTableView.delegate = self
        roomTableView.dataSource = self
        
        self.roomPickerView.delegate = self
        self.roomPickerView.dataSource = self
        createItems()
    }
    
    
    @IBAction func submitButton(_ sender: Any) {
        let objSecondVC = self.storyboard!.instantiateViewController(withIdentifier: "TrainerWorkFlow1") as! RequestController
        objSecondVC.selectedRoom2 = roomResult
        self.navigationController?.pushViewController(objSecondVC, animated: true)
        os_log("Room picked",log: OSLog.default, type: .info)
        self.present(objSecondVC, animated: true, completion: nil)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
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
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return result.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return result[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        // use the row to get the selected row from the picker view
        // using the row extract the value from your datasource (array[row])
        let selectedRoom = result[row].description
        let room = selectedRoom.substring(from: selectedRoom.index(after: selectedRoom.index(of: " ")!))
        roomResult = Int(room)!
        self.roomTableView.reloadData()
    }
    
    func createItems(){
        let rooms:[Room] = selectAllRooms()
        for room in rooms{
            let tempResult = room.roomNumber
            result.append("Room \(tempResult!)")
        }
    }
    
    
}

