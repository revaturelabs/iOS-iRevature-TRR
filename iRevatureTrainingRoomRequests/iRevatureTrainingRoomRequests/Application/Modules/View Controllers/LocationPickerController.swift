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
        let storyboard = UIStoryboard(name: "Login", bundle: nil)
        
        // Instantiate the desired view controller from the storyboard using the view controllers identifier
        // Cast is as the custom view controller type you created in order to access it's properties and methods
        let customViewController = storyboard.instantiateViewController(withIdentifier: "HomeScreen")
        present(customViewController, animated: false, completion: nil)
    }
    
    @IBAction func submitButton(_ sender: Any) {
        present(TrainerVC, animated: false, completion: nil)
    }

    /*let backVC:UIViewController = UIStoryboard(name: "Login", bundle:nil).instantiateViewController(withIdentifier: "Login") as UIViewController as! LoginController
    */
    let TrainerVC:UIViewController = UIStoryboard(name: "TrainerWorkFlow", bundle:nil).instantiateViewController(withIdentifier: "TrainerWorkFlow0") as UIViewController
    
}

