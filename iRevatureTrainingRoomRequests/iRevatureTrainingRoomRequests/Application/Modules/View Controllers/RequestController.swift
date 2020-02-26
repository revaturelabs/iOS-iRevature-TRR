//
//  SourceController.swift
//  iRevatureTrainingRoomRequests
//
//  Created by Nathan Coggins on 2/14/20.
//  Copyright © 2020 revature. All rights reserved.
//

import UIKit
import os.log

//Class to manage Requests
class RequestController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    @IBOutlet weak var roomTableView: UITableView!
    @IBOutlet weak var commentsTextField: UITextView!
    @IBOutlet weak var startDatePicker: UIDatePicker!
    @IBOutlet weak var endDatePicker: UIDatePicker!
    @IBOutlet weak var RequestSegControl: UISegmentedControl!
    
    var segControlValue:Int = Int()
    var selectedDate:String = String()
    var selectedDate2:String = String()
    var selectedRoom2:Int?
    var displayedRoom2: [String] = []
    
    //not fully implemented, need for future
    //segmented control change handler
    @IBAction func RequestSegControlChange(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            //let segControlValue = 0
        }
        else if sender.selectedSegmentIndex == 1 {
            //let segControlValue = 1
        }
        else if sender.selectedSegmentIndex == 2 {
            //let segControlValue = 2
        }
    }
    
    //returns to the previous screen
    @IBAction func viewAllRoomsButton(_ sender: Any) {
            let objSecondVC = self.storyboard!.instantiateViewController(withIdentifier: "TrainerWorkFlow0") as! RoomPickerController
            objSecondVC.roomResult = selectedRoom2!
            self.navigationController?.pushViewController(objSecondVC, animated: true)
            self.present(objSecondVC, animated: true, completion: nil)
    }
    
    //Moves to the Swap request screen and sends the proper data to the next controller
    @IBAction func submitButton(_ sender: Any) {
        if segControlValue == 0{
            startDatePicker.datePickerMode = UIDatePicker.Mode.date
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MM/dd/yyyy"
            let selectedDate = dateFormatter.string(from: startDatePicker.date)
            
            endDatePicker.datePickerMode = UIDatePicker.Mode.date
            let dateFormatter2 = DateFormatter()
            dateFormatter2.dateFormat = "MM/dd/yyyy"
            let selectedDate2 = dateFormatter.string(from: endDatePicker.date)
            
            let dateRange = selectedDate + " - " + selectedDate2
        
            let objSecondVC = self.storyboard!.instantiateViewController(withIdentifier: "TrainerWorkFlow2") as! SwapController
            objSecondVC.selectedRoom3 = selectedRoom2
            objSecondVC.dateRange2 = dateRange
            objSecondVC.startDate = selectedDate
            objSecondVC.endDate = selectedDate2
            self.navigationController?.pushViewController(objSecondVC, animated: true)
            os_log("Move to swap request",log: OSLog.default, type: .info)
            self.present(objSecondVC, animated: true, completion: nil)
        }
    }

    //initializes the table view
    override func viewDidLoad() {
        super.viewDidLoad()
       // setupTableView()
        roomTableView.delegate = self
        roomTableView.dataSource = self
    }
    
    //sets the number of components in table view
    func numberOfSections(in tableView: UITableView) -> Int {
     return 1
    }
    
    //sets the number of rows in table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     return 3
    }
    
    //populates the table view with the room info, gathered from previous screen
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let room = roomByNumber(number: selectedRoom2!)
        let cell = roomTableView.dequeueReusableCell(withIdentifier: "roomCell", for: indexPath) as! RoomTableViewCell
        displayedRoom2.append("Room #: \((room?.roomNumber)!)")
        displayedRoom2.append("Batch Name: \((room?.batchName)!)")
        displayedRoom2.append("Instructor Name: \((room?.instructorName)!)")
        cell.roomNumber?.text = displayedRoom2[indexPath.row]
        return cell
      }
}
