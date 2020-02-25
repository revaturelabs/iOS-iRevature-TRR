//
//  SourceController.swift
//  iRevatureTrainingRoomRequests
//
//  Created by Nathan Coggins on 2/14/20.
//  Copyright © 2020 revature. All rights reserved.
//

import UIKit

var userInfo = UserInfoBusinessService()
class RequestController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    @IBOutlet weak var roomTableView: UITableView!
    @IBOutlet weak var commentsTextField: UITextView!
    @IBOutlet weak var startDatePicker: UIDatePicker!
    @IBOutlet weak var endDatePicker: UIDatePicker!
    @IBOutlet weak var RequestSegControl: UISegmentedControl!
    
    var segControlValue:Int = Int()
    var dayString:String = String()
    var monthString:String = String()
    var yearString:String = String()
    var dayString2:String = String()
    var monthString2:String = String()
    var yearString2:String = String()
    var dateRange:String = String()
    
    @IBAction func RequestSegControlChange(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            let segControlValue = 0
        }
        else if sender.selectedSegmentIndex == 1 {
            let segControlValue = 1
        }
        else if sender.selectedSegmentIndex == 2 {
            let segControlValue = 2
        }
    }
    
    @IBAction func submitButton(_ sender: Any) {
        if segControlValue == 0{
            let calendar = Calendar.current
            let components = calendar.dateComponents([.day,.month,.year], from: self.startDatePicker.date);
            if let day = components.day, let month = components.month, let year = components.year {
                let dayString = String(day)
                let monthString = String(month)
                let yearString = String(year)
            }
            let componenets2 = calendar.dateComponents([.day,.month,.year], from: self.endDatePicker.date);
            if let day = components.day, let month = components.month, let year = components.year {
                let dayString2 = String(day)
                let monthString2 = String(month)
                let yearString2 = String(year)
            }
            let dateRange = dayString + "/" + monthString + "/" + yearString + " - " + dayString2 + "/" + monthString2 + "/" + yearString2
            
            
            
            
            let objSecondVC = self.storyboard!.instantiateViewController(withIdentifier: "TrainerWorkFlow2") as! SwapController
            objSecondVC.selectedRoom3 = selectedRoom2
            objSecondVC.dateRange2 = dateRange
            self.navigationController?.pushViewController(objSecondVC, animated: true)
            self.present(objSecondVC, animated: true, completion: nil)
        }
    }
    
    
    var test = userInfo.getUserInfoDB()
    var selectedRoom2:Int?
    var displayedRoom2: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
       // setupTableView()
        roomTableView.delegate = self
        roomTableView.dataSource = self
        
        RequestSegControl.addTarget(self, action: "RequestSegControlChange:", for:.valueChanged)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
     return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     return 3
    }
    
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
