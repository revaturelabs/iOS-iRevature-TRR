//
//  ViewController.swift
//  iRevatureTrainingRoomRequests
//
//  Created by Nathan Coggins on 2/11/20.
//  Copyright © 2020 revature. All rights reserved.
//

import UIKit

class LoginController: BaseController {

    
    @IBOutlet weak var loginButton: UIButton!
    
    @IBAction func loginButton(_ sender: Any) {
        present(secondVC, animated: false, completion: nil)
    }

        let secondVC:UIViewController = UIStoryboard(name: "LocationPicker", bundle:nil).instantiateViewController(withIdentifier: "LocationPicker") as UIViewController
}
