//
//  LocationPickerController.swift
//  iRevatureTrainingRoomRequests
//
//  Created by Nathan Coggins on 2/14/20.
//  Copyright © 2020 revature. All rights reserved.
//

import UIKit

class LocationPickerController: BaseController {
    
    @IBOutlet weak var locationPickerView: UIPickerView!
    
    @IBAction func logOutButton(_ sender: Any) {
        present(backVC, animated: false, completion: nil)
    }
    let backVC:UIViewController = UIStoryboard(name: "Login", bundle:nil).instantiateViewController(withIdentifier: "Login") as UIViewController
    
    
    @IBAction func submitButton(_ sender: Any) {
        present(secondVC, animated: false, completion: nil)
    }
    let secondVC:UIViewController = UIStoryboard(name: "TrainerWorkFlow0", bundle:nil).instantiateViewController(withIdentifier: "TrainerWorkFlow0") as UIViewController
    
}

