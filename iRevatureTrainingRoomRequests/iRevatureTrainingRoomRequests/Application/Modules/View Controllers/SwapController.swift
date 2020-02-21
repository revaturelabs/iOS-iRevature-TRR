//
//  RequestController.swift
//  iRevatureTrainingRoomRequests
//
//  Created by Nathan Coggins on 2/14/20.
//  Copyright © 2020 revature. All rights reserved.
//

import UIKit
var roomInfo2 = RoomInfoBusinessService()
class SwapController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var roomTableView: UITableView!
    
    @IBOutlet weak var secondRoomPicker: UIPickerView!
    
    @IBAction func submitButton(_ sender: UIButton) {
    }
    
    
    var test = userInfo.getUserInfoDB()
         
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
           return 6
       }
       
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                
              let cell = roomTableView.dequeueReusableCell(withIdentifier: "roomCell", for: indexPath) as! RoomTableViewCell
              cell.roomNumber?.text = test?.name
              return cell
       }
       
}

