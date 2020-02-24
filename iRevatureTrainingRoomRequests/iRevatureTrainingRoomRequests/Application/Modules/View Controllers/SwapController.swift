//
//  RequestController.swift
//  iRevatureTrainingRoomRequests
//
//  Created by Nathan Coggins on 2/14/20.
//  Copyright © 2020 revature. All rights reserved.
//

import UIKit
var roomInfo2 = RoomInfoBusinessService()
class SwapController: UIViewController, UITableViewDataSource, UITableViewDelegate, UIPickerViewDataSource, UIPickerViewDelegate{
    
    @IBOutlet weak var roomTableView: UITableView!
    
    @IBOutlet weak var secondRoomPicker: UIPickerView!
    
    @IBAction func submitButton(_ sender: UIButton) {
    }
    
    var result:[String] = []
    var roomResult:Int = 1
    
    var test = userInfo.getUserInfoDB()
    var displayedRoom3: [String] = []
    
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
        let room = roomByNumber(number: roomResult)
        let cell = roomTableView.dequeueReusableCell(withIdentifier: "roomCell", for: indexPath) as! RoomTableViewCell
        displayedRoom3.append("Date")
        displayedRoom3.append("1st Room #: \((room?.roomNumber)!)")
        displayedRoom3.append("1st Batch Name: \((room?.batchName)!)")
        displayedRoom3.append("1st Instructor Name: \((room?.instructorName)!)")
        // add second room
        displayedRoom3.append("2nd Room #: \((room?.roomNumber)!)")
        displayedRoom3.append("2nd Batch Name: \((room?.batchName)!)")
        displayedRoom3.append("2nd Instructor Name: \((room?.instructorName)!)")
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
        roomResult = Int(selectedRoom)!
    }
    
    func createItems(){
        let rooms:[Room] = selectAllRooms()
        for room in rooms{
            let tempResult = room.roomNumber
            result.append("Room \(tempResult!)")
        }
    }
}

