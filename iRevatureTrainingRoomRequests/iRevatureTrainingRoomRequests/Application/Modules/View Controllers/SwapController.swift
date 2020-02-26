//
//  RequestController.swift
//  iRevatureTrainingRoomRequests
//
//  Created by Nathan Coggins on 2/14/20.
//  Copyright © 2020 revature. All rights reserved.
//

import UIKit
import os.log

class SwapController: UIViewController, UITableViewDataSource, UITableViewDelegate, UIPickerViewDataSource, UIPickerViewDelegate{
    
    @IBOutlet weak var roomTableView: UITableView!
    
    @IBOutlet weak var secondRoomPicker: UIPickerView!
    
    var result:[String] = []
    var roomResult:Int = 1
    var selectedRoom3:Int?
    var displayedRoom3: [String] = []
    var dateRange2:String = String()
    var startDate:String = String()
    var endDate:String = String()
    
    @IBAction func backButton(_ sender: Any) {
        let objSecondVC = self.storyboard!.instantiateViewController(withIdentifier: "TrainerWorkFlow1") as! RequestController
        objSecondVC.selectedRoom2 = selectedRoom3
        self.navigationController?.pushViewController(objSecondVC, animated: true)
        self.present(objSecondVC, animated: true, completion: nil)
    }
    
    @IBAction func submitButton(_ sender: UIButton) {
        os_log("Swap Request sent",log: OSLog.default, type: .info)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // setupTableView()
        roomTableView.delegate = self
        roomTableView.dataSource = self
        
        self.secondRoomPicker.delegate = self
        self.secondRoomPicker.dataSource = self
        createItems()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        displayedRoom3 = []
        let room = roomByNumber(number: selectedRoom3!)
        let room2 = roomByNumber(number: roomResult)
        let cell = roomTableView.dequeueReusableCell(withIdentifier: "roomCell", for: indexPath) as! RoomTableViewCell
        displayedRoom3.append("Start/End Date: " + dateRange2)
        displayedRoom3.append("1st Room #: \((room?.roomNumber)!)")
        displayedRoom3.append("1st Batch Name: \((room?.batchName)!)")
        displayedRoom3.append("1st Instructor Name: \((room?.instructorName)!)")
        
        // add second room
        displayedRoom3.append("2nd Room #: \((room2?.roomNumber)!)")
        displayedRoom3.append("2nd Batch Name: \((room2?.batchName)!)")
        displayedRoom3.append("2nd Instructor Name: \((room2?.instructorName)!)")
        cell.roomNumber?.text = displayedRoom3[indexPath.row]
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
        let room = String(selectedRoom[selectedRoom.index(after: selectedRoom.index(of: " ")!)...])
        roomResult = Int(room)!
        self.roomTableView.reloadData()
    }
    
    func createItems(){
        let rooms:[Room] = selectAllRooms()
        result.removeAll()
        for room in rooms{
            let tempResult = room.roomNumber
            result.append("Room \(tempResult!)")
        }
    }
}

