//
//  LocationPickerController.swift
//  iRevatureTrainingRoomRequests
//
//  Created by Nathan Coggins on 2/14/20.
//  Copyright © 2020 revature. All rights reserved.
//

import UIKit

class LocationPickerController: BaseController {
    
    override func viewDidLoad() {
    }

    @IBOutlet weak var locationPickerView: UIPickerView!
    @IBOutlet weak var welcomeTextField: UILabel!
    
    @IBAction func logOutButton(_ sender: Any) {
        //present(backVC, animated: false, completion: nil)
        dismiss(animated: false, completion: nil)
    }
    
    @IBAction func submitButton(_ sender: Any) {
        present(TrainerVC, animated: false, completion: nil)
    }

    /*let backVC:UIViewController = UIStoryboard(name: "Login", bundle:nil).instantiateViewController(withIdentifier: "Login") as UIViewController as! LoginController
    */
    let TrainerVC:UIViewController = UIStoryboard(name: "TrainerWorkFlow", bundle:nil).instantiateViewController(withIdentifier: "TrainerWorkFlow0") as UIViewController
    
}

