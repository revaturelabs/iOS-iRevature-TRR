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
    @IBOutlet weak var requestSegControl: UISegmentedControl!
    
    @IBAction func RequestSegControlAction(_ sender: Any) {
    }
    
    var test = userInfo.getUserInfoDB()
    var selectedRoom2:Int = Int()
    var displayedRoom2: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
       // setupTableView()
        roomTableView.delegate = self
        roomTableView.dataSource = self
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
     return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let room = roomByNumber(number: selectedRoom2)
        let cell = roomTableView.dequeueReusableCell(withIdentifier: "roomCell", for: indexPath) as! RoomTableViewCell
        displayedRoom2.append("\((room?.roomNumber)!)")
        displayedRoom2.append("\((room?.batchName)!)")
        displayedRoom2.append("\((room?.instructorName)!)")
        cell.roomNumber?.text = displayedRoom2[indexPath.row]
        return cell
      }

}
