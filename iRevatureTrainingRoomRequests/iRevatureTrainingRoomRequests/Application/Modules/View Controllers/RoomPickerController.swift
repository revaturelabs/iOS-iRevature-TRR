//
//  RoomPickerController.swift
//  iRevatureTrainingRoomRequests
//
//  Created by Nathan Coggins on 2/14/20.
//  Copyright © 2020 revature. All rights reserved.
//

import UIKit
var roomInfo = RoomInfoBusinessService()
class RoomPickerController: UIViewController, UITableViewDataSource, UITableViewDelegate, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var roomTableView: UITableView!
    @IBOutlet weak var roomPickerView: UIPickerView!
    @IBOutlet weak var roomSegControl: UISegmentedControl!
    
    var test = userInfo.getUserInfoDB()
    var test2: [String] = []
      
      override func viewDidLoad() {
          super.viewDidLoad()
         // setupTableView()
          roomTableView.delegate = self
          roomTableView.dataSource = self
        
        self.roomPickerView.delegate = self
        self.roomPickerView.dataSource = self
        createItems()
      }
    
    func numberOfSections(in tableView: UITableView) -> Int {
     return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
             
           let cell = roomTableView.dequeueReusableCell(withIdentifier: "roomCell", for: indexPath) as! RoomTableViewCell
           cell.roomNumber?.text = test?.name
           return cell
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return test2.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return test2[row]
    }
    
    func createItems(){
        for i in 0...3{
            test2.append(test!.name)
        }
    }
    
    
}

